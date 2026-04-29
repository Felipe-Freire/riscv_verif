# --- Configurable Variables (Default Values) ---
TEST_NAME   ?= riscv_arithmetic_basic_test
TEST_RTL    ?= ibex_core_base_test
SEED        ?= 1
ITERATIONS  ?= 1
ISA         ?= rv32imc
VERBOSITY   ?= UVM_MEDIUM
GUI         ?= 0
HEX_FILE    ?= default.hex
TOHOST_ADDR ?= 80001000

# --- Absolute Paths ---
ROOT_DIR   := $(shell pwd)/..
RTL_DIR    := $(ROOT_DIR)/rtl/ibex/rtl
VENDOR_DIR := $(ROOT_DIR)/rtl/ibex/vendor/lowrisc_ip
TB_DIR     := $(ROOT_DIR)/ibex_core_dv/tb
ENV_DIR    := $(ROOT_DIR)/ibex_core_dv/env
TESTS_DIR  := $(ROOT_DIR)/ibex_core_dv/tests
COSIM_DIR  := $(ROOT_DIR)/rtl/ibex/dv/cosim
COSIM_COMM := $(ROOT_DIR)/rtl/ibex/dv/uvm/core_ibex/common/ibex_cosim_agent

# Logs will be in out/logs relative to cwd (sim/)
OUT_DIR    := ./out
LOG_DIR    := $(OUT_DIR)/logs

# --- EXPORTS for .f files to see ---
export IBEX_CORE_ENV_PATH   := $(ENV_DIR)
export IBEX_CORE_TEST_PATH  := $(TESTS_DIR)
export UVMA_CLK_RST_PATH    := $(ROOT_DIR)/uvm_agents/uvma_clk_rst
export UVMA_SIMPLE_MEM_PATH := $(ROOT_DIR)/uvm_agents/uvma_simple_mem
export UVMA_RVFI_PATH       := $(ROOT_DIR)/uvm_agents/uvma_rvfi
export UVMA_INTERRUPT_PATH  := $(ROOT_DIR)/uvm_agents/uvma_interrupt
export UVMA_ISACOV_PATH     := $(ROOT_DIR)/uvm_agents/uvma_isacov
export UVML_MEM_PATH        := $(ROOT_DIR)/uvm_libs/uvml_mem
export IBEX_RTL_PATH        := $(ROOT_DIR)/rtl/ibex/rtl

# These macros align the RTL, UVM, and Spike with the riscv-dv memory map.
ARCH_DEFINES := +define+DM_ADDR=1A11_0000 \
                +define+DM_ADDR_MASK=0000_0FFF \
                +define+BOOT_ADDR=8000_0000 \
                +define+DEBUG_MODE_HALT_ADDR=8000_0000 \
                +define+DEBUG_MODE_EXCEPTION_ADDR=8000_0008

.PHONY: all setup clean

all: comp_rtl comp_tb sim

setup:
	@mkdir -p $(LOG_DIR)
	@mkdir -p $(OUT_DIR)/waves
	@mkdir -p $(OUT_DIR)/cov
	@if [ ! -d "work" ]; then vlib work; vmap work work; fi

clean:
	@echo "--- Cleaning Workspace ---"
	rm -rf $(OUT_DIR) work transcript *.wlf modelsim.ini cosim_dpi.so

include ../scripts/Makefile.comp
include ../scripts/Makefile.sim