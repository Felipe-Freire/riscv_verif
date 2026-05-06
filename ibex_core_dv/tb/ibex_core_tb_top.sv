`timescale 1ns/1ps

import uvm_pkg::*;
`include "uvm_macros.svh"

`include "cosim_dpi.svh"
`include "spike_cosim_dpi.svh"

import ibex_core_test_pkg::*;

module ibex_core_tb_top;

  // Physical interfaces
  uvma_clk_rst_if    clk_rst_if  ();
  uvma_simple_mem_if instr_mem_if(.clk(clk_rst_if.clk), .rst_n(clk_rst_if.reset_n));
  uvma_simple_mem_if data_mem_if (.clk(clk_rst_if.clk), .rst_n(clk_rst_if.reset_n));
  uvma_rvfi_instr_if rvfi_if_inst(.clk(clk_rst_if.clk), .rst_n(clk_rst_if.reset_n));
  uvma_interrupt_if  interrupt_if(.clk(clk_rst_if.clk), .rst_n(clk_rst_if.reset_n));

  // Ibex Parameters
  parameter bit          PMPEnable        = 1'b0;
  parameter int unsigned PMPGranularity   = 0;
  parameter int unsigned PMPNumRegions    = 4;
  parameter int unsigned MHPMCounterNum   = 0;
  parameter int unsigned MHPMCounterWidth = 40;
  parameter bit RV32E                     = 1'b0;
  parameter ibex_pkg::rv32m_e   RV32M     = ibex_pkg::RV32MFast;
  parameter ibex_pkg::rv32b_e   RV32B     = ibex_pkg::RV32BNone;
  parameter ibex_pkg::regfile_e RegFile   = ibex_pkg::RegFileFF;
  parameter bit BranchTargetALU           = 1'b0;
  parameter bit WritebackStage            = 1'b0;
  parameter bit ICache                    = 1'b0;
  parameter bit ICacheECC                 = 1'b0;
  parameter bit BranchPredictor           = 1'b0;
  parameter bit SecureIbex                = 1'b0;
  parameter bit ICacheScramble            = 1'b0;
  parameter bit DbgTriggerEn              = 1'b0;
  parameter int unsigned DmBaseAddr       = 32'h`DM_ADDR;
  parameter int unsigned DmAddrMask       = 32'h`DM_ADDR_MASK;
  parameter int unsigned DmHaltAddr       = 32'h`DEBUG_MODE_HALT_ADDR;
  parameter int unsigned DmExceptionAddr  = 32'h`DEBUG_MODE_EXCEPTION_ADDR;

  // Ibex Inputs
  parameter int unsigned BootAddr         = 32'h`BOOT_ADDR;
  parameter ibex_pkg::ibex_mubi_t FetchEn = ibex_pkg::IbexMuBiOn;

  // DUT Instance using the tracing top-level wrapper
  ibex_top_tracing #(
    .PMPEnable        (PMPEnable        ),
    .PMPGranularity   (PMPGranularity   ),
    .PMPNumRegions    (PMPNumRegions    ),
    .MHPMCounterNum   (MHPMCounterNum   ),
    .MHPMCounterWidth (MHPMCounterWidth ),
    .RV32E            (RV32E            ),
    .RV32M            (RV32M            ),
    .RV32B            (RV32B            ),
    .RegFile          (RegFile          ),
    .BranchTargetALU  (BranchTargetALU  ),
    .WritebackStage   (WritebackStage   ),
    .ICache           (ICache           ),
    .ICacheECC        (ICacheECC        ),
    .SecureIbex       (SecureIbex       ),
    .ICacheScramble   (ICacheScramble   ),
    .BranchPredictor  (BranchPredictor  ),
    .DbgTriggerEn     (DbgTriggerEn     ),
    .DmBaseAddr       (DmBaseAddr       ),
    .DmAddrMask       (DmAddrMask       ),
    .DmHaltAddr       (DmHaltAddr       ),
    .DmExceptionAddr  (DmExceptionAddr  )
  ) dut (
    // Clock and Reset
    .clk_i       (clk_rst_if.clk),
    .rst_ni      (clk_rst_if.reset_n),

    // Test and Configuration Signals
    .test_en_i   (1'b0),
    .scan_rst_ni (1'b1),
    .ram_cfg_i   ('0),
    .hart_id_i   (32'h0),
    .boot_addr_i (BootAddr),

    // Execution Control
    .fetch_enable_i         (FetchEn),
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

  initial begin
    uvm_config_db#(virtual uvma_clk_rst_if   )::set(null, "uvm_test_top.env.clk_rst_agent", "vif", clk_rst_if    );
    uvm_config_db#(virtual uvma_simple_mem_if)::set(null, "uvm_test_top.env.data_mem_agent", "vif", data_mem_if  );
    uvm_config_db#(virtual uvma_simple_mem_if)::set(null, "uvm_test_top.env.instr_mem_agent", "vif", instr_mem_if);
    uvm_config_db#(virtual uvma_rvfi_instr_if)::set(null, "uvm_test_top.env.rvfi_agent", "vif", rvfi_if_inst );
    uvm_config_db#(virtual uvma_interrupt_if )::set(null, "uvm_test_top.env.interrupt_agent", "vif", interrupt_if);

    uvm_config_db#(bit              )::set(null, "*", "RV32E", RV32E);
    uvm_config_db#(ibex_pkg::rv32m_e)::set(null, "*", "RV32M", RV32M);
    uvm_config_db#(ibex_pkg::rv32b_e)::set(null, "*", "RV32B", RV32B);
    uvm_config_db#(bit [31:0]       )::set(null, "*", "PMPNumRegions", PMPNumRegions);
    uvm_config_db#(bit [31:0]       )::set(null, "*", "PMPGranularity", PMPGranularity);
    uvm_config_db#(bit [31:0]       )::set(null, "*", "MHPMCounterNum", MHPMCounterNum);
    uvm_config_db#(bit              )::set(null, "*", "SecureIbex", SecureIbex);
    uvm_config_db#(bit              )::set(null, "*", "ICache", ICache);

    run_test();
  end
endmodule