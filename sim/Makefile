# --- Configurable Variables (Default Values) ---
TEST      ?= ibex_core_sanity_test
SEED      ?= 1
VERBOSITY ?= UVM_MEDIUM
GUI       ?= 0

# --- Absolute Paths ---
ROOT_DIR  := $(shell pwd)/..
RTL_DIR   := $(ROOT_DIR)/rtl/ibex/rtl
VENDOR_DIR := $(ROOT_DIR)/rtl/ibex/vendor/lowrisc_ip
TB_DIR    := $(ROOT_DIR)/ibex_core_dv/tb
ENV_DIR   := $(ROOT_DIR)/ibex_core_dv/env
TESTS_DIR := $(ROOT_DIR)/ibex_core_dv/tests
OUT_DIR   := ./out

# --- EXPORTS for .f files to see ---
export UVMA_CLK_RST_PATH := $(ROOT_DIR)/uvm_agents/uvma_clk_rst
export IBEX_RTL_PATH     := $(ROOT_DIR)/rtl/ibex/rtl
# export UVMA_SIMPLE_MEM_PATH := $(ROOT_DIR)/uvm_agents/uvma_simple_mem

# --- Tools ---
# Suppressing Ibex RTL warnings
# VLOG      := vlog -64 -sv +acc -L mtiUvm -suppress 13314,2583
# VOPT      := vopt -64 +acc -suppress 13314,2583
VLOG      := vlog -64 -sv +acc -L mtiUvm
VOPT      := vopt -64 +acc
VSIM      := vsim -64 -L mtiUvm

# --- Targets ---
.PHONY: all setup comp opt run wave clean

all: comp opt run

# 1. Create output directories and ModelSim work library
setup:
	@mkdir -p $(OUT_DIR)/logs
	@mkdir -p $(OUT_DIR)/waves
	@if [ ! -d "work" ]; then vlib work; vmap work work; fi

# 2. Compilation (RTL -> Agents -> Env -> Tests -> Top)
comp: setup
	@echo "--- Compiling Design and Verification ---"
	$(VLOG) \
	+define+RVFI \
	+incdir+$(VENDOR_DIR)/ip/prim/rtl \
	+incdir+$(VENDOR_DIR)/dv/sv/dv_utils \
	-f ./ibex_core_rtl.f \
	-f $(UVMA_CLK_RST_PATH)/uvma_clk_rst.f \
	+incdir+$(ENV_DIR) \
	$(ENV_DIR)/ibex_core_env_pkg.sv \
	+incdir+$(TESTS_DIR) \
	$(TESTS_DIR)/ibex_core_test_pkg.sv \
	$(TB_DIR)/ibex_core_tb_top.sv \
	-l $(OUT_DIR)/logs/compile.log

# 3. Optimization (Required in Questa for performance and signal visibility)
opt: comp
	@echo "--- Optimizing ---"
	$(VOPT) ibex_core_tb_top -o ibex_core_tb_top_opt -l $(OUT_DIR)/logs/opt.log

# 4. Simulation (CLI / Batch Mode)
run: opt
	@echo "--- Running Test: $(TEST) (Seed: $(SEED)) ---"
	$(VSIM) -c ibex_core_tb_top_opt \
	-sv_seed $(SEED) \
	+UVM_TESTNAME=$(TEST) \
	+UVM_VERBOSITY=$(VERBOSITY) \
	-l $(OUT_DIR)/logs/sim_$(TEST)_$(SEED).log \
	-do "run -all; exit"

# 5. Graphical Mode (Debug com GUI)
wave: opt
	@echo "--- Opening QuestaSim GUI for $(TEST) ---"
	$(VSIM) ibex_core_tb_top_opt \
	-sv_seed $(SEED) \
	+UVM_TESTNAME=$(TEST) \
	+UVM_VERBOSITY=$(VERBOSITY) \
	-do "add wave -r /*; run -all"

# 6. Cleanup
clean:
	@echo "--- Cleaning Workspace ---"
	rm -rf $(OUT_DIR) work transcript *.wlf modelsim.ini