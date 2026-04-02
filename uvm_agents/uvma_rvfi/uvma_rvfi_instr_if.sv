`ifndef __UVMA_RVFI_INSTR_IF_SV__
`define __UVMA_RVFI_INSTR_IF_SV__

// ALL SIGNALS ARE NOW PORTS (inside the parentheses)
interface uvma_rvfi_instr_if (
  input logic        clk,
  input logic        rst_n,

  input logic        rvfi_valid,
  input logic [63:0] rvfi_order,
  input logic [31:0] rvfi_insn,
  input logic        rvfi_trap,
  input logic [31:0] rvfi_pc_rdata,
  input logic [31:0] rvfi_pc_wdata,
  
  input logic [ 4:0] rvfi_rs1_addr,
  input logic [31:0] rvfi_rs1_rdata,
  input logic [ 4:0] rvfi_rs2_addr,
  input logic [31:0] rvfi_rs2_rdata,
  input logic [ 4:0] rvfi_rd_addr,
  input logic [31:0] rvfi_rd_wdata,

  input logic [31:0] rvfi_mem_addr,
  input logic [ 3:0] rvfi_mem_rmask,
  input logic [ 3:0] rvfi_mem_wmask,
  input logic [31:0] rvfi_mem_rdata,
  input logic [31:0] rvfi_mem_wdata
);

  timeunit 1ns;
  timeprecision 1ps;

  // Passive timing block (read-only) remains unchanged
  clocking mon_cb @(posedge clk);
    default input #1step;
    
    input rvfi_valid, rvfi_order, rvfi_insn, rvfi_trap;
    input rvfi_pc_rdata, rvfi_pc_wdata;
    input rvfi_rs1_addr, rvfi_rs1_rdata, rvfi_rs2_addr, rvfi_rs2_rdata;
    input rvfi_rd_addr, rvfi_rd_wdata;
    input rvfi_mem_addr, rvfi_mem_rmask, rvfi_mem_wmask, rvfi_mem_rdata, rvfi_mem_wdata;
  endclocking

endinterface : uvma_rvfi_instr_if

`endif // __UVMA_RVFI_INSTR_IF_SV__