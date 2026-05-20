# ==============================================================================
# Ibex (RV32IMC) UVM Verification — Top-Level Makefile
# ==============================================================================
# Usage (from project root):
#   make -C sim -f $(pwd)/scripts/Makefile <target> PROJ_ROOT=$(pwd)
#
# Or via the regression manager:
#   python3 scripts/run_regression.py --steps all
# ==============================================================================

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

# --- Simulator Selection (Pillar 4) ---
SIMULATOR   ?= questa

# --- Project Root (passed from Python or manually) ---
# Fail loudly if not provided — never guess from pwd.
PROJ_ROOT   ?= $(error PROJ_ROOT must be set. Run from project root via the regression script or pass PROJ_ROOT explicitly.)

# --- Derived Paths (all absolute, from PROJ_ROOT) ---
RTL_DIR    := $(PROJ_ROOT)/rtl/ibex/rtl
VENDOR_DIR := $(PROJ_ROOT)/rtl/ibex/vendor/lowrisc_ip
TB_DIR     := $(PROJ_ROOT)/ibex_core_dv/tb
ENV_DIR    := $(PROJ_ROOT)/ibex_core_dv/env
TESTS_DIR  := $(PROJ_ROOT)/ibex_core_dv/tests
COSIM_DIR  := $(PROJ_ROOT)/rtl/ibex/dv/cosim
COSIM_COMM := $(PROJ_ROOT)/rtl/ibex/dv/uvm/core_ibex/common/ibex_cosim_agent

# --- Tools ---
CUSTOM_TARGET := $(PROJ_ROOT)/ibex_core_dv/riscv-dv_config/target/rv32imc
USR_EXTENSION := $(PROJ_ROOT)/vendor/riscv-dv/user_extension  

# Logs/output stay relative to CWD (sim/) — make -C sim handles this.
OUT_DIR    := ./out
LOG_DIR    := $(OUT_DIR)/logs

# --- EXPORTS for .f files to see ---
export IBEX_CORE_ENV_PATH   := $(ENV_DIR)
export IBEX_CORE_TEST_PATH  := $(TESTS_DIR)
export UVMA_CLK_RST_PATH    := $(PROJ_ROOT)/uvm_agents/uvma_clk_rst
export UVMA_SIMPLE_MEM_PATH := $(PROJ_ROOT)/uvm_agents/uvma_simple_mem
export UVMA_RVFI_PATH       := $(PROJ_ROOT)/uvm_agents/uvma_rvfi
export UVMA_INTERRUPT_PATH  := $(PROJ_ROOT)/uvm_agents/uvma_interrupt
export UVMA_ISACOV_PATH     := $(PROJ_ROOT)/uvm_agents/uvma_isacov
export UVML_MEM_PATH        := $(PROJ_ROOT)/uvm_libs/uvml_mem
export IBEX_RTL_PATH        := $(PROJ_ROOT)/rtl/ibex/rtl

# These macros align the RTL, UVM, and Spike with the riscv-dv memory map.
ARCH_DEFINES := +define+DM_ADDR=1A11_0000 \
                +define+DM_ADDR_MASK=0000_0FFF \
                +define+BOOT_ADDR=8000_0000 \
                +define+DEBUG_MODE_HALT_ADDR=8000_0000 \
                +define+DEBUG_MODE_EXCEPTION_ADDR=8000_0008

# ==============================================================================
# Common Targets
# ==============================================================================
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

# ==============================================================================
# Simulator-Specific Includes (Pillar 4)
# ==============================================================================
ifeq ($(SIMULATOR), questa)
  include $(PROJ_ROOT)/scripts/Makefile.comp
  include $(PROJ_ROOT)/scripts/Makefile.sim
else ifeq ($(SIMULATOR), verilator)
  $(info *** Verilator backend: not yet implemented ***)
  # Future: include $(PROJ_ROOT)/scripts/Makefile.comp.verilator
  # Future: include $(PROJ_ROOT)/scripts/Makefile.sim.verilator
else
  $(error Unsupported SIMULATOR='$(SIMULATOR)'. Supported values: questa, verilator)
endif