`ifndef __IBEX_CORE_BASE_TEST_SV__
`define __IBEX_CORE_BASE_TEST_SV__

class ibex_core_base_test extends uvm_test;
  `uvm_component_utils(ibex_core_base_test)

  ibex_core_env    env;

  uvma_clk_rst_cfg    clk_rst_cfg;
  uvma_simple_mem_cfg instr_mem_cfg;
  uvma_simple_mem_cfg data_mem_cfg;
  uvma_rvfi_cfg       rvfi_cfg;
  uvma_isacov_cfg     isacov_cfg;

  uvm_tlm_analysis_fifo#(uvma_rvfi_seq_item) rvfi_fifo;
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
    
    // Configure the Clock Agent to be ACTIVE
    clk_rst_cfg = uvma_clk_rst_cfg::type_id::create("clk_rst_cfg");
    clk_rst_cfg.is_active = UVM_ACTIVE;
    uvm_config_db#(uvma_clk_rst_cfg)::set(this, "env.clk_rst_agent*", "cfg", clk_rst_cfg);

    // Configure the Instruction Memory Agent to be ACTIVE
    instr_mem_cfg = uvma_simple_mem_cfg::type_id::create("instr_mem_cfg");
    instr_mem_cfg.is_active = UVM_ACTIVE;
    instr_mem_cfg.enabled   = 1;
    uvm_config_db#(uvma_simple_mem_cfg)::set(this, "env.instr_mem_agent*", "cfg", instr_mem_cfg);

    // Configure the Data Memory Agent to be ACTIVE
    data_mem_cfg = uvma_simple_mem_cfg::type_id::create("data_mem_cfg");
    data_mem_cfg.is_active = UVM_ACTIVE;
    data_mem_cfg.enabled   = 1;
    uvm_config_db#(uvma_simple_mem_cfg)::set(this, "env.data_mem_agent*", "cfg", data_mem_cfg);

    // Configure the RVFI Agent to be ACTIVE
    rvfi_cfg = uvma_rvfi_cfg::type_id::create("rvfi_cfg");
    rvfi_cfg.is_active = UVM_PASSIVE;
    uvm_config_db#(uvma_rvfi_cfg)::set(this, "env.rvfi_agent*", "cfg", rvfi_cfg);

    // Configure the ISACOV Agent to be ACTIVE
    isacov_cfg = uvma_isacov_cfg::type_id::create("isacov_cfg");
    // You can use randomize in the future for regressions:
    // assert(isacov_cfg.randomize() with { ext_m_supported == 1; });
    isacov_cfg.is_active = UVM_PASSIVE;
    isacov_cfg.ext_m_supported = 1;
    isacov_cfg.ext_c_supported = 1;
    uvm_config_db#(uvma_isacov_cfg)::set(this, "env.isacov_agent*", "cfg", isacov_cfg);

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
    
    env.shared_mem.load_hex(hex_file_path);

    if (!uvm_config_db#(chandle)::get(this, "", "spike_handle", spike_handle)) begin
      `uvm_fatal("BASE_TEST", "Could not retrieve spike_handle from tb_top!")
    end

    env.shared_mem.get_backdoor_memory(mem_copy);

    foreach (mem_copy[addr]) begin
      riscv_cosim_write_mem_byte(spike_handle, addr, mem_copy[addr]);
    end

    `uvm_info("BASE_TEST", "Instruction memory loaded and synchronized with co-simulation model.", UVM_LOW)
  endfunction

  // Firing of Reactive Sequences (Background Daemons)
  task run_phase(uvm_phase phase);
    uvma_clk_rst_sanity_seq  clk_rst_seq;
    uvma_simple_mem_resp_seq instr_resp_seq;
    uvma_simple_mem_resp_seq data_resp_seq;
    
    super.run_phase(phase);
    
    clk_rst_seq    = uvma_clk_rst_sanity_seq::type_id::create("clk_rst_seq");
    instr_resp_seq = uvma_simple_mem_resp_seq::type_id::create("instr_resp_seq");
    data_resp_seq  = uvma_simple_mem_resp_seq::type_id::create("data_resp_seq");
    
    phase.raise_objection(this, "Background Memory Sequences Running");
    fork
      clk_rst_seq.start(env.clk_rst_agent.sequencer);
      instr_resp_seq.start(env.instr_mem_agent.sequencer);
      data_resp_seq.start(env.data_mem_agent.sequencer);
      monitor_test_done(phase);
      watchdog_timeout();
    join_none
    
    `uvm_info("BASE_TEST", "Background Memory Sequences Started.", UVM_LOW)
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
          `uvm_info("TEST_VERDICT", "\n\n*** TEST PASSED! (via TOHOST) ***\n", UVM_NONE)
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
          `uvm_info("TEST_VERDICT", "\n\n*** TEST PASSED! (via ECALL) ***\n", UVM_NONE)
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
