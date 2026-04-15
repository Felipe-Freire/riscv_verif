`ifndef __IBEX_CORE_BASE_TEST_SV__
`define __IBEX_CORE_BASE_TEST_SV__

class ibex_core_base_test extends uvm_test;
  `uvm_component_utils(ibex_core_base_test)

  ibex_core_env   env;
  ibex_core_cfg   cfg;
  ibex_core_cntxt cntxt;

  uvm_tlm_analysis_fifo#(uvma_rvfi_seq_item) rvfi_fifo;

  ibex_core_boot_vseq boot_vseq;

  bit [31:0] tohost_addr;

  function new(string name="ibex_core_base_test", uvm_component parent=null);
    super.new(name, parent);
    rvfi_fifo = new("rvfi_fifo");
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    if (!$value$plusargs("TOHOST_ADDR=%h", tohost_addr)) begin
      `uvm_fatal("BASE_TEST", "TOHOST_ADDR not provided! Use +TOHOST_ADDR=address")
    end

    if (!uvm_config_db#(ibex_core_cfg)::get(this, "", "cfg", cfg)) begin
      cfg = ibex_core_cfg::type_id::create("env_cfg");
      if (!cfg.randomize()) begin
        `uvm_fatal("BASE_TEST", "Falha ao randomizar env_cfg")
      end
      uvm_config_db#(ibex_core_cfg)::set(this, "*", "cfg", cfg);
    end

    // Build the Environment
    env = ibex_core_env::type_id::create("env", this);
  endfunction

  // Connect the RVFI Agent's analysis port to the FIFO for later retrieval in the test
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    env.rvfi_agent.ap.connect(rvfi_fifo.analysis_export);
  endfunction

  // Print the UVM topology at the start of simulation (great for debugging)
  function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    uvm_top.print_topology();
  endfunction

  function void start_of_simulation_phase(uvm_phase phase);
    chandle spike_handle;
    reg [7:0] mem_copy [bit[32-1:0]];
    string hex_file_path;

    super.start_of_simulation_phase(phase);

    if (!$value$plusargs("HEX_FILE=%s", hex_file_path)) begin
      `uvm_fatal("BASE_TEST", "Path to HEX file not provided! Use +HEX_FILE=path/to/file.hex")
    end
    
    env.cntxt.shared_mem.load_hex(hex_file_path);

    if (!uvm_config_db#(chandle)::get(this, "", "spike_handle", spike_handle)) begin
      `uvm_fatal("BASE_TEST", "Could not retrieve spike_handle from tb_top!")
    end

    env.cntxt.shared_mem.get_backdoor_memory(mem_copy);

    foreach (mem_copy[addr]) begin
      riscv_cosim_write_mem_byte(spike_handle, addr, mem_copy[addr]);
    end

    `uvm_info("BASE_TEST", "Instruction memory loaded and synchronized with co-simulation model.", UVM_LOW)
  endfunction

  // Firing of Reactive Sequences (Background Daemons)
  task run_phase(uvm_phase phase);  
    super.run_phase(phase);
    phase.raise_objection(this, "Base Test Initialization Running");

    fork
      monitor_test_done(phase);
      watchdog_timeout();
    join_none

    // Executa o BOOT completo do sistema usando a Virtual Sequence!
    boot_vseq = ibex_core_boot_vseq::type_id::create("boot_vseq");
    boot_vseq.start(env.vsqr);
    
    `uvm_info("BASE_TEST", "Background Memory and Clk/Rst Sequences Started.", UVM_LOW)
  endtask

  task monitor_test_done(uvm_phase phase);
    uvma_rvfi_seq_item rvfi_trn;
    bit [31:0] gp_reg = 0; // Tracker for register x3 (GP)

    forever begin
      rvfi_fifo.get(rvfi_trn);

      // 1. Track the GP register value
      // Whenever an instruction writes to register 3 (x3), keep that value.
      if (rvfi_trn.rd_addr == 5'd3 && rvfi_trn.rd_wdata != 0) begin
        gp_reg = rvfi_trn.rd_wdata;
      end

      // 2. Classic condition: end on TOHOST write
      if (rvfi_trn.mem_wmask != 0 && rvfi_trn.mem_addr == tohost_addr) begin
        if (rvfi_trn.mem_wdata == 1) begin
          `uvm_info("TEST_VERDICT", "\n\n*** TEST PASSED! (via TOHOST) ***\n", UVM_LOW)
        end else begin
          `uvm_error("TEST_VERDICT", $sformatf("\n\n*** TEST FAILED! (via TOHOST) Code: %0d ***\n", rvfi_trn.mem_wdata))
        end
        phase.drop_objection(this, "End detected via tohost");
        break;
      end

      // 3. Bare-metal condition: end on ECALL (0x00000073)
      // Based on RVFI log: INSN: 0x00000073
      if (rvfi_trn.insn == 32'h00000073) begin
        if (gp_reg == 1) begin
          `uvm_info("TEST_VERDICT", "\n\n*** TEST PASSED! (via ECALL) ***\n", UVM_LOW)
        end else begin
          `uvm_error("TEST_VERDICT", $sformatf("\n\n*** TEST FAILED! (via ECALL) GP Code: %0d ***\n", gp_reg))
        end
        #10ns;
        phase.drop_objection(this, "End detected via ECALL");
        break; // Exit the forever loop
      end
    end
  endtask

  task watchdog_timeout();
    #500ms;
    `uvm_fatal("TIMEOUT", "Simulation reached timeout without writing to tohost!")
  endtask

endclass : ibex_core_base_test

`endif // __IBEX_CORE_BASE_TEST_SV__
