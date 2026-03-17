`ifndef __UVMA_SIMPLE_MEM_IF_SV__
`define __UVMA_SIMPLE_MEM_IF_SV__

interface uvma_simple_mem_if (input logic clk, input logic rst_n);
  timeunit 1ns;
  timeprecision 1ps;

  logic        req;
  logic        gnt;
  logic [31:0] addr;
  logic        we;
  logic [3:0 ] be;
  logic [31:0] wdata;
  logic [6:0 ] wdata_intg;
  logic        rvalid;
  logic [31:0] rdata;
  logic [6:0 ] rdata_intg;
  logic        err;

  clocking slave_cb @(posedge clk);
    default input #1step output #2ns;
    
    input  req, addr, we, be, wdata, wdata_intg;
    output gnt, rvalid, rdata, rdata_intg, err;
  endclocking

  clocking mon_cb @(posedge clk);
    default input #1step output #2ns;
    
    input req, gnt, addr, we, be, wdata, wdata_intg;
    input rvalid, rdata, rdata_intg, err;
  endclocking

  modport slave (
    clocking slave_cb,
    input    rst_n
  );

  modport passive (
    clocking mon_cb,
    input    rst_n
  );

endinterface : uvma_simple_mem_if

`endif // __UVMA_SIMPLE_MEM_IF_SV__
