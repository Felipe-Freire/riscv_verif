`timescale 1ns/1ps

import uvm_pkg::*;
`include "uvm_macros.svh"

import ibex_core_test_pkg::*;

module ibex_core_tb_top;

  // Fisic Interface uvma_clk_rst_if;
  uvma_clk_rst_if clk_rst_if();

  // (Future) Ibex Core Instance:
  // ibex_core_top dut (
  //   .clk_i (clk_rst_if.clk),
  //   .rst_ni(clk_rst_if.reset_n),
  //   ...
  // );

  initial begin
    uvm_config_db#(virtual uvma_clk_rst_if)::set(null, "uvm_test_top.env.clk_rst_agent", "vif", clk_rst_if);
    run_test("ibex_core_sanity_test");
  end
endmodule