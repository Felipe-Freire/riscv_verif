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

  // Cosim configuration 
  string cosim_log_file;
  bit [31:0] pmp_num_regions;
  bit [31:0] pmp_granularity;
  bit [31:0] mhpm_counter_num;
  bit        secure_ibex;
  bit        icache;

  function new(string name="ibex_core_base_test", uvm_component parent=null);
    super.new(name, parent);
    rvfi_fifo = new("rvfi_fifo");
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    if (!$value$plusargs("TOHOST_ADDR=%h", tohost_addr)) begin
      `uvm_fatal("BASE_TEST", "TOHOST_ADDR not provided! Use +TOHOST_ADDR=address")
    end

    if (!$value$plusargs("SPIKE_LOG=%s", cosim_log_file)) begin
      cosim_log_file = "";
    end

    if (!uvm_config_db#(ibex_core_cfg)::get(this, "", "cfg", cfg)) begin
      cfg = ibex_core_cfg::type_id::create("env_cfg");
      if (!cfg.randomize()) begin
        `uvm_fatal("BASE_TEST", "Falha ao randomizar env_cfg")
      end
      uvm_config_db#(ibex_core_cfg)::set(this, "*", "cfg", cfg);
    end

    if (!uvm_config_db#(bit [31:0])::get(null, "", "PMPNumRegions", pmp_num_regions)) begin
      pmp_num_regions = '0;
    end

    if (!uvm_config_db#(bit [31:0])::get(null, "", "PMPGranularity", pmp_granularity)) begin
      pmp_granularity = '0;
    end

    if (!uvm_config_db#(bit [31:0])::get(null, "", "MHPMCounterNum", mhpm_counter_num)) begin
      mhpm_counter_num = '0;
    end

    if (!uvm_config_db#(bit)::get(null, "", "SecureIbex", secure_ibex)) begin
      secure_ibex = '0;
    end

    if (!uvm_config_db#(bit)::get(null, "", "ICache", icache)) begin
      icache = '0;
    end

    cfg.isa_string       = "rv32imc";
    cfg.start_pc         = ((32'h`BOOT_ADDR & ~(32'h0000_00FF)) | 8'h80);
    cfg.start_mtvec      = ((32'h`BOOT_ADDR & ~(32'h0000_00FF)) | 8'h01);
    cfg.probe_imem_for_errs = 1'b0;
    cfg.relax_cosim_check = 1'b0; // By default, strict checking. Can be relaxed via config if needed.
    cfg.log_file         = cosim_log_file;
    cfg.pmp_num_regions  = pmp_num_regions;
    cfg.pmp_granularity  = pmp_granularity;
    cfg.mhpm_counter_num = mhpm_counter_num;
    cfg.secure_ibex      = secure_ibex;
    cfg.icache           = icache;
    cfg.dm_start_addr    = 32'h`DM_ADDR;
    cfg.dm_end_addr      = 32'h`DEBUG_MODE_EXCEPTION_ADDR;

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

  // Firing of Reactive Sequences (Background Daemons)
  task run_phase(uvm_phase phase);  
    super.run_phase(phase);
    phase.raise_objection(this, "Base Test Initialization Running");

    fork
      monitor_test_done(phase);
      watchdog_timeout();
    join_none

    execute_vseq();
  endtask

  virtual task execute_vseq();
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
