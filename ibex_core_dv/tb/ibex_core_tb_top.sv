`timescale 1ns/1ps

import uvm_pkg::*;
`include "uvm_macros.svh"

import ibex_core_test_pkg::*;

module ibex_core_tb_top;

  // Fisic Interface
  uvma_clk_rst_if clk_rst_if();
  uvma_simple_mem_if instr_mem_if(.clk(clk_rst_if.clk), .rst_n(clk_rst_if.reset_n));
  uvma_simple_mem_if data_mem_if (.clk(clk_rst_if.clk), .rst_n(clk_rst_if.reset_n));

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
    .irq_software_i (1'b0),
    .irq_timer_i    (1'b0),
    .irq_external_i (1'b0),
    .irq_fast_i     (15'b0),
    .irq_nm_i       (1'b0),
    
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

  initial begin
    uvm_config_db#(virtual uvma_clk_rst_if)::set(null, "uvm_test_top.env.clk_rst_agent", "vif", clk_rst_if);
    uvm_config_db#(virtual uvma_simple_mem_if)::set(null, "uvm_test_top.env.data_mem_agent", "vif", data_mem_if);
    uvm_config_db#(virtual uvma_simple_mem_if)::set(null, "uvm_test_top.env.instr_mem_agent", "vif", instr_mem_if);

    run_test("ibex_core_sanity_test");
  end
endmodule