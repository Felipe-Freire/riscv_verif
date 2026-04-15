`timescale 1ns/1ps

import uvm_pkg::*;
`include "uvm_macros.svh"

`include "cosim_dpi.svh"

import ibex_core_test_pkg::*;

module ibex_core_tb_top;

  // Physical interfaces
  uvma_clk_rst_if    clk_rst_if  ();
  uvma_simple_mem_if instr_mem_if(.clk(clk_rst_if.clk), .rst_n(clk_rst_if.reset_n));
  uvma_simple_mem_if data_mem_if (.clk(clk_rst_if.clk), .rst_n(clk_rst_if.reset_n));
  uvma_rvfi_instr_if rvfi_if_inst(.clk(clk_rst_if.clk), .rst_n(clk_rst_if.reset_n));
  uvma_interrupt_if  interrupt_if(.clk(clk_rst_if.clk), .rst_n(clk_rst_if.reset_n));

  // Static signals
  logic [31:0]          boot_addr;
  ibex_pkg::ibex_mubi_t fetch_en;

  assign boot_addr = 32'h0000_0000;
  assign fetch_en  = ibex_pkg::IbexMuBiOn;

  // DUT Instance using the tracing top-level wrapper
  ibex_top_tracing #(
    .PMPEnable(0),
    .RV32E(0),
    .RV32M(ibex_pkg::RV32MFast) // Fast multiplier
  ) dut (
    // Clock and Reset
    .clk_i       (clk_rst_if.clk),
    .rst_ni      (clk_rst_if.reset_n),

    // Test and Configuration Signals
    .test_en_i   (1'b0),
    .scan_rst_ni (1'b1),
    .ram_cfg_i   ('0),
    .hart_id_i   (32'h0),
    .boot_addr_i (boot_addr),

    // Execution Control
    .fetch_enable_i         (fetch_en),
    .alert_minor_o          (),
    .alert_major_internal_o (),
    .alert_major_bus_o      (),
    .core_sleep_o           (),
    
    // Interrupts
    .irq_software_i (interrupt_if.irq_software),
    .irq_timer_i    (interrupt_if.irq_timer),
    .irq_external_i (interrupt_if.irq_external),
    .irq_fast_i     (interrupt_if.irq_fast),
    .irq_nm_i       (interrupt_if.irq_nm),
    
    // Scrambling Interface (I-Cache Crypto)
    .scramble_key_valid_i (1'b0),
    .scramble_key_i       ('0),
    .scramble_nonce_i     ('0),
    .scramble_req_o       (),

    // Debug Interface
    .debug_req_i         (1'b0),
    .crash_dump_o        (),
    .double_fault_seen_o (),

    // Instruction Interface
    .instr_req_o        (instr_mem_if.req),
    .instr_gnt_i        (instr_mem_if.gnt),
    .instr_rvalid_i     (instr_mem_if.rvalid),
    .instr_addr_o       (instr_mem_if.addr),
    .instr_rdata_i      (instr_mem_if.rdata),
    .instr_rdata_intg_i (instr_mem_if.rdata_intg),
    .instr_err_i        (instr_mem_if.err),

    // Data Interface
    .data_req_o         (data_mem_if.req),
    .data_gnt_i         (data_mem_if.gnt),
    .data_rvalid_i      (data_mem_if.rvalid),
    .data_we_o          (data_mem_if.we),
    .data_be_o          (data_mem_if.be),
    .data_addr_o        (data_mem_if.addr),
    .data_wdata_o       (data_mem_if.wdata),
    .data_wdata_intg_o  (data_mem_if.wdata_intg),
    .data_rdata_i       (data_mem_if.rdata),
    .data_rdata_intg_i  (data_mem_if.rdata_intg),
    .data_err_i         (data_mem_if.err)
  );

  // RVFI Interface Explicit Assignments
  assign rvfi_if_inst.rvfi_valid     = dut.rvfi_valid;
  assign rvfi_if_inst.rvfi_order     = dut.rvfi_order;
  assign rvfi_if_inst.rvfi_insn      = dut.rvfi_insn;
  assign rvfi_if_inst.rvfi_trap      = dut.rvfi_trap;
  assign rvfi_if_inst.rvfi_halt      = dut.rvfi_halt;
  assign rvfi_if_inst.rvfi_intr      = dut.rvfi_intr;
  assign rvfi_if_inst.rvfi_mode      = dut.rvfi_mode;
  assign rvfi_if_inst.rvfi_ixl       = dut.rvfi_ixl;
  assign rvfi_if_inst.rvfi_pc_rdata  = dut.rvfi_pc_rdata;
  assign rvfi_if_inst.rvfi_pc_wdata  = dut.rvfi_pc_wdata;
  assign rvfi_if_inst.rvfi_rs1_addr  = dut.rvfi_rs1_addr;
  assign rvfi_if_inst.rvfi_rs1_rdata = dut.rvfi_rs1_rdata;
  assign rvfi_if_inst.rvfi_rs2_addr  = dut.rvfi_rs2_addr;
  assign rvfi_if_inst.rvfi_rs2_rdata = dut.rvfi_rs2_rdata;
  assign rvfi_if_inst.rvfi_rs3_addr  = dut.rvfi_rs3_addr;
  assign rvfi_if_inst.rvfi_rs3_rdata = dut.rvfi_rs3_rdata;
  assign rvfi_if_inst.rvfi_rd_addr   = dut.rvfi_rd_addr;
  assign rvfi_if_inst.rvfi_rd_wdata  = dut.rvfi_rd_wdata;
  assign rvfi_if_inst.rvfi_mem_addr  = dut.rvfi_mem_addr;
  assign rvfi_if_inst.rvfi_mem_rmask = dut.rvfi_mem_rmask;
  assign rvfi_if_inst.rvfi_mem_wmask = dut.rvfi_mem_wmask;
  assign rvfi_if_inst.rvfi_mem_rdata = dut.rvfi_mem_rdata;
  assign rvfi_if_inst.rvfi_mem_wdata = dut.rvfi_mem_wdata;
  assign rvfi_if_inst.rvfi_ext_pre_mip          = dut.rvfi_ext_pre_mip;
  assign rvfi_if_inst.rvfi_ext_post_mip         = dut.rvfi_ext_post_mip;
  assign rvfi_if_inst.rvfi_ext_nmi              = dut.rvfi_ext_nmi;
  assign rvfi_if_inst.rvfi_ext_nmi_int          = dut.rvfi_ext_nmi_int;
  assign rvfi_if_inst.rvfi_ext_debug_req        = dut.rvfi_ext_debug_req;
  assign rvfi_if_inst.rvfi_ext_debug_mode       = dut.rvfi_ext_debug_mode;
  assign rvfi_if_inst.rvfi_ext_rf_wr_suppress   = dut.rvfi_ext_rf_wr_suppress;
  assign rvfi_if_inst.rvfi_ext_mcycle           = dut.rvfi_ext_mcycle;
  assign rvfi_if_inst.rvfi_ext_mhpmcounters     = dut.rvfi_ext_mhpmcounters;
  assign rvfi_if_inst.rvfi_ext_mhpmcountersh    = dut.rvfi_ext_mhpmcountersh;
  assign rvfi_if_inst.rvfi_ext_ic_scr_key_valid = dut.rvfi_ext_ic_scr_key_valid;
  assign rvfi_if_inst.rvfi_ext_irq_valid        = dut.rvfi_ext_irq_valid;

  chandle spike_handle;
  
  initial begin
    // Create Spike lockstep co-simulation model starting at reset vector.
    spike_handle = riscv_cosim_init("RV32IMC", 32'h80);
    
    if (spike_handle == null) begin
      `uvm_fatal("COSIM", "Failed to initialize the Spike C++ co-simulation model")
    end

    uvm_config_db#(virtual uvma_clk_rst_if   )::set(null, "uvm_test_top.env.clk_rst_agent", "vif", clk_rst_if    );
    uvm_config_db#(virtual uvma_simple_mem_if)::set(null, "uvm_test_top.env.data_mem_agent", "vif", data_mem_if  );
    uvm_config_db#(virtual uvma_simple_mem_if)::set(null, "uvm_test_top.env.instr_mem_agent", "vif", instr_mem_if);
    uvm_config_db#(virtual uvma_rvfi_instr_if)::set(null, "uvm_test_top.env.rvfi_agent", "vif", rvfi_if_inst );
    uvm_config_db#(virtual uvma_interrupt_if )::set(null, "uvm_test_top.env.interrupt_agent", "vif", interrupt_if);

    uvm_config_db#(chandle)                   ::set(null, "*", "spike_handle", spike_handle                      );

    run_test();
  end
endmodule