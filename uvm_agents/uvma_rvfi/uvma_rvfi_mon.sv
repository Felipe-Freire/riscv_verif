`ifndef __UVMA_RVFI_MON_SV__
`define __UVMA_RVFI_MON_SV__

class uvma_rvfi_mon extends uvm_monitor;
  `uvm_component_utils(uvma_rvfi_mon)

  uvma_rvfi_cfg   cfg;
  uvma_rvfi_cntxt cntxt;

  // Port used to send captured data to the scoreboard
  uvm_analysis_port#(uvma_rvfi_seq_item) ap;

  function new(string name="uvma_rvfi_mon", uvm_component parent=null);
    super.new(name, parent);
    ap = new("ap", this);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    if (!uvm_config_db#(uvma_rvfi_cfg)::get(this, "", "cfg", cfg))
      `uvm_fatal("CFG", "RVFI monitor could not find CFG")
      
    if (!uvm_config_db#(uvma_rvfi_cntxt)::get(this, "", "cntxt", cntxt))
      `uvm_fatal("CNTXT", "RVFI monitor could not find CNTXT")
  endfunction

  task run_phase(uvm_phase phase);
    uvma_rvfi_seq_item trn;
    
    // Robust UVM reset pattern:
    // 1. Wait for pin to go to 0 (active reset) or already be at 0
    wait (cntxt.vif.rst_n === 1'b0);
    // 2. Wait for pin to go to 1 (leaving reset)
    wait (cntxt.vif.rst_n === 1'b1);

    `uvm_info("RVFI_MON", "Reset complete. Monitor active and listening on the bus!", UVM_LOW)

    forever begin
      // Synchronize on monitor clock edge (sampling previous-cycle values)
      @(cntxt.vif.mon_cb);

      // The key signal: Ibex indicates an instruction has just committed
      if (cntxt.vif.mon_cb.rvfi_valid === 1'b1) begin
        trn = uvma_rvfi_seq_item::type_id::create("trn");

        // Capture an exact snapshot of the pipeline state
        trn.order     = cntxt.vif.mon_cb.rvfi_order;
        trn.insn      = cntxt.vif.mon_cb.rvfi_insn;
        trn.trap      = cntxt.vif.mon_cb.rvfi_trap;
        trn.halt      = cntxt.vif.mon_cb.rvfi_halt;
        trn.intr      = cntxt.vif.mon_cb.rvfi_intr;
        trn.mode      = cntxt.vif.mon_cb.rvfi_mode;
        trn.ixl       = cntxt.vif.mon_cb.rvfi_ixl;
        trn.pc_rdata  = cntxt.vif.mon_cb.rvfi_pc_rdata;
        trn.pc_wdata  = cntxt.vif.mon_cb.rvfi_pc_wdata;
        
        trn.rs1_addr  = cntxt.vif.mon_cb.rvfi_rs1_addr;
        trn.rs1_rdata = cntxt.vif.mon_cb.rvfi_rs1_rdata;
        trn.rs2_addr  = cntxt.vif.mon_cb.rvfi_rs2_addr;
        trn.rs2_rdata = cntxt.vif.mon_cb.rvfi_rs2_rdata;
        trn.rs3_addr  = cntxt.vif.mon_cb.rvfi_rs3_addr;
        trn.rs3_rdata = cntxt.vif.mon_cb.rvfi_rs3_rdata;
        trn.rd_addr   = cntxt.vif.mon_cb.rvfi_rd_addr;
        trn.rd_wdata  = cntxt.vif.mon_cb.rvfi_rd_wdata;

        trn.mem_addr  = cntxt.vif.mon_cb.rvfi_mem_addr;
        trn.mem_rmask = cntxt.vif.mon_cb.rvfi_mem_rmask;
        trn.mem_rdata = cntxt.vif.mon_cb.rvfi_mem_rdata;
        trn.mem_wmask = cntxt.vif.mon_cb.rvfi_mem_wmask;
        trn.mem_wdata = cntxt.vif.mon_cb.rvfi_mem_wdata;

        trn.ext_pre_mip          = cntxt.vif.mon_cb.rvfi_ext_pre_mip;
        trn.ext_post_mip         = cntxt.vif.mon_cb.rvfi_ext_post_mip;
        trn.ext_nmi              = cntxt.vif.mon_cb.rvfi_ext_nmi;
        trn.ext_nmi_int          = cntxt.vif.mon_cb.rvfi_ext_nmi_int;
        trn.ext_debug_req        = cntxt.vif.mon_cb.rvfi_ext_debug_req;
        trn.ext_debug_mode       = cntxt.vif.mon_cb.rvfi_ext_debug_mode;
        trn.ext_rf_wr_suppress   = cntxt.vif.mon_cb.rvfi_ext_rf_wr_suppress;
        trn.ext_mcycle           = cntxt.vif.mon_cb.rvfi_ext_mcycle;
        trn.ext_mhpmcounters     = cntxt.vif.mon_cb.rvfi_ext_mhpmcounters;
        trn.ext_mhpmcountersh    = cntxt.vif.mon_cb.rvfi_ext_mhpmcountersh;
        trn.ext_ic_scr_key_valid = cntxt.vif.mon_cb.rvfi_ext_ic_scr_key_valid;
        trn.ext_irq_valid        = cntxt.vif.mon_cb.rvfi_ext_irq_valid;

        // Print formatted transaction string
        `uvm_info("RVFI_MON", trn.convert2string(), UVM_DEBUG)

        // Send to scoreboard
        ap.write(trn);
      end
    end
  endtask

endclass : uvma_rvfi_mon

`endif // __UVMA_RVFI_MON_SV__