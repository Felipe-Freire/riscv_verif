`ifndef __COSIM_DPI_SVH__
`define __COSIM_DPI_SVH__

import "DPI-C" context function chandle riscv_cosim_init(string isa, int start_pc);

import "DPI-C" context function void riscv_cosim_write_mem_byte(chandle handle, int addr, byte data);

import "DPI-C" context function int riscv_cosim_step(chandle handle, int rd, int wdata, int pc, int trap);

import "DPI-C" context function void riscv_cosim_set_interrupt(chandle handle, int mask, int val);

import "DPI-C" context function int riscv_cosim_get_num_errors(chandle handle);

import "DPI-C" context function string riscv_cosim_get_error(chandle handle, int index);

import "DPI-C" context function void riscv_cosim_clear_errors(chandle handle);

`endif // __COSIM_DPI_SVH__
