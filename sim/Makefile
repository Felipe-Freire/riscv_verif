# --- Configurable Variables (Default Values) ---
TEST      ?= ibex_sanity_test
SEED      ?= 1
VERBOSITY ?= UVM_MEDIUM
GUI       ?= 0

# Paths
ROOT_DIR  := $(shell pwd)/..
RTL_DIR   := $(ROOT_DIR)/rtl/ibex/rtl
TB_DIR    := $(ROOT_DIR)/ibex_core_dv/tb
LIB_DIR   := $(ROOT_DIR)/uvm_libs
AGNT_DIR  := $(ROOT_DIR)/uvm_agents
ENV_DIR   := $(ROOT_DIR)/ibex_core_dv/env
OUT_DIR   := ./out

# Tools
VLOG      := vlog -64 -sv +acc
VOPT      := vopt -64 +acc
VSIM      := vsim -64

# --- Targets ---

.PHONY: all clean comp run

all: comp run

# 1. Create output directories
setup:
	mkdir -p $(OUT_DIR)/logs
	mkdir -p $(OUT_DIR)/waves

# 2. Compilation (RTL + Lib + TB)
# Order matters! First packages, interfaces, then modules.
comp: setup
	@echo "--- Compiling Design and Verification ---"
	$(VLOG) \
	+incdir+$(AGNT_DIR)/uvma_clk_rst \
	+incdir+$(AGNT_DIR)/uvma_simple_mem \
	+incdir+$(ENV_DIR) \
	+define+RVFI \
	-f $(RTL_DIR)/ibex_core.f \
	$(AGNT_DIR)/uvma_clk_rst/uvma_clk_rst_pkg.sv \
	$(AGNT_DIR)/uvma_simple_mem/uvma_simple_mem_pkg.sv \
	$(ENV_DIR)/ibex_env_pkg.sv \
	$(TB_DIR)/tb_top.sv \
	-l $(OUT_DIR)/logs/compile.log

# 3. Optimization (Required in Questa to view signals)
opt: comp
	@echo "--- Optimizing ---"
	$(VOPT) tb_top -o tb_top_opt -l $(OUT_DIR)/logs/opt.log

# 4. Simulation (Execution)
run: opt
	@echo "--- Running Test: $(TEST) (Seed: $(SEED)) ---"
	$(VSIM) tb_top_opt \
	-sv_seed $(SEED) \
	+UVM_TESTNAME=$(TEST) \
	+UVM_VERBOSITY=$(VERBOSITY) \
	-l $(OUT_DIR)/logs/sim_$(TEST)_$(SEED).log \
	-do "run -all; exit"

# 5. Graphical Mode (Debug)
wave: opt
	$(VSIM) tb_top_opt \
	-sv_seed $(SEED) \
	+UVM_TESTNAME=$(TEST) \
	-do "add wave -r /*; run -all" &

# 6. Cleanup
clean:
	rm -rf $(OUT_DIR) work transcript *.wlf