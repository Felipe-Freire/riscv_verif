`ifndef __UVMA_RVFI_INSTR_IF_SV__
`define __UVMA_RVFI_INSTR_IF_SV__

interface uvma_rvfi_instr_if (input logic clk, input logic rst_n);
  timeunit 1ns;
  timeprecision 1ps;

  logic        rvfi_valid;
  logic [63:0] rvfi_order;
  logic [31:0] rvfi_insn;
  logic        rvfi_trap;
  logic        rvfi_halt;
  logic        rvfi_intr;
  logic [ 1:0] rvfi_mode;
  logic [ 1:0] rvfi_ixl;
  logic [31:0] rvfi_pc_rdata;
  logic [31:0] rvfi_pc_wdata;
  
  logic [ 4:0] rvfi_rs1_addr;
  logic [31:0] rvfi_rs1_rdata;
  logic [ 4:0] rvfi_rs2_addr;
  logic [31:0] rvfi_rs2_rdata;
  logic [ 4:0] rvfi_rs3_addr;
  logic [31:0] rvfi_rs3_rdata;
  logic [ 4:0] rvfi_rd_addr;
  logic [31:0] rvfi_rd_wdata;

  logic [31:0] rvfi_mem_addr;
  logic [ 3:0] rvfi_mem_rmask;
  logic [ 3:0] rvfi_mem_wmask;
  logic [31:0] rvfi_mem_rdata;
  logic [31:0] rvfi_mem_wdata;

  logic [31:0] rvfi_ext_pre_mip;
  logic [31:0] rvfi_ext_post_mip;
  logic        rvfi_ext_nmi;
  logic        rvfi_ext_nmi_int;
  logic        rvfi_ext_debug_req;
  logic        rvfi_ext_debug_mode;
  logic        rvfi_ext_rf_wr_suppress;
  logic [63:0] rvfi_ext_mcycle;

  // Unpacked arrays
  logic [31:0] rvfi_ext_mhpmcounters  [10];
  logic [31:0] rvfi_ext_mhpmcountersh [10];

  logic        rvfi_ext_ic_scr_key_valid;
  logic        rvfi_ext_irq_valid;

  // Passive timing block (read-only) remains unchanged
  clocking mon_cb @(posedge clk);
    default input #1step;
    
    input rvfi_valid, rvfi_order, rvfi_insn, rvfi_trap;
    input rvfi_halt, rvfi_intr, rvfi_mode, rvfi_ixl;
    input rvfi_pc_rdata, rvfi_pc_wdata;
    input rvfi_rs1_addr, rvfi_rs1_rdata, rvfi_rs2_addr, rvfi_rs2_rdata;
    input rvfi_rs3_addr, rvfi_rs3_rdata;
    input rvfi_rd_addr, rvfi_rd_wdata;
    input rvfi_mem_addr, rvfi_mem_rmask, rvfi_mem_wmask, rvfi_mem_rdata, rvfi_mem_wdata;
    input rvfi_ext_pre_mip, rvfi_ext_post_mip, rvfi_ext_nmi, rvfi_ext_nmi_int;
    input rvfi_ext_debug_req, rvfi_ext_debug_mode, rvfi_ext_rf_wr_suppress, rvfi_ext_mcycle;
    // input rvfi_ext_mhpmcounters, rvfi_ext_mhpmcountersh;
    input rvfi_ext_ic_scr_key_valid, rvfi_ext_irq_valid;
  endclocking

endinterface : uvma_rvfi_instr_if

`endif // __UVMA_RVFI_INSTR_IF_SV__