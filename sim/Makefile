# --- Configurable Variables (Default Values) ---
TEST_NAME   ?= riscv_arithmetic_basic_test
TEST_RTL    ?= ibex_core_base_test
SEED        ?= 1
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
COSIM_DIR  := $(ROOT_DIR)/cosim_dpi
OUT_DIR    := ./out

# --- EXPORTS for .f files to see ---
export UVMA_CLK_RST_PATH 		:= $(ROOT_DIR)/uvm_agents/uvma_clk_rst
export UVMA_SIMPLE_MEM_PATH := $(ROOT_DIR)/uvm_agents/uvma_simple_mem
export UVMA_RVFI_PATH     	:= $(ROOT_DIR)/uvm_agents/uvma_rvfi
export UVMA_ISACOV_PATH     := $(ROOT_DIR)/uvm_agents/uvma_isacov
export UVML_MEM_PATH     		:= $(ROOT_DIR)/uvm_libs/uvml_mem
export IBEX_RTL_PATH     		:= $(ROOT_DIR)/rtl/ibex/rtl
# export UVMA_SIMPLE_MEM_PATH := $(ROOT_DIR)/uvm_agents/uvma_simple_mem

# --- Tools ---
# Suppressing Ibex RTL warnings
# VLOG      := vlog -64 -sv +acc -L mtiUvm -suppress 13314,2583
# VOPT      := vopt -64 +acc -suppress 13314,2583
VLOG      := vlog -64 -sv +acc -L mtiUvm
VOPT      := vopt -64 +acc
VSIM      := vsim -64 -L mtiUvm

# --- DPI-C Config ---
MTI_HOME   			 ?= /home/felipe/mentor_graphics_eda/questasim
COSIM_SPIKE_PATH ?= /opt/riscv
CXX        			 := g++
CXXFLAGS 				 := -shared -fPIC -std=c++17 -I$(MTI_HOME)/include -I$(COSIM_SPIKE_PATH)/include
LDFLAGS  				 := -L$(COSIM_SPIKE_PATH)/lib -Wl,-rpath=$(COSIM_SPIKE_PATH)/lib -lriscv -lfesvr


# --- Targets ---
.PHONY: all setup comp opt run wave clean

all: comp opt run

# 1. Create output directories and ModelSim work library
setup:
	@mkdir -p $(OUT_DIR)/logs
	@mkdir -p $(OUT_DIR)/waves
	@if [ ! -d "work" ]; then vlib work; vmap work work; fi

dpi: setup
	@echo "--- Compiling C++ Wrapper for DPI-C ---"
	$(CXX) $(CXXFLAGS) $(COSIM_DIR)/cosim_dpi.cpp $(LDFLAGS) -o cosim_dpi.so

# 2. Compilation (RTL -> Agents -> Env -> Tests -> Top)
comp: dpi
	@echo "--- Compiling Design and Verification ---"
	$(VLOG) \
	+define+RVFI \
	+define+INC_ASSERT \
	+incdir+$(VENDOR_DIR)/ip/prim/rtl \
	+incdir+$(VENDOR_DIR)/dv/sv/dv_utils \
	+incdir+$(COSIM_DIR) \
	-f ./ibex_core_rtl.f \
	-f $(UVMA_CLK_RST_PATH)/uvma_clk_rst.f \
	-f $(UVML_MEM_PATH)/uvml_mem.f \
	-f $(UVMA_SIMPLE_MEM_PATH)/uvma_simple_mem.f \
	-f $(UVMA_RVFI_PATH)/uvma_rvfi.f \
	-f $(UVMA_ISACOV_PATH)/uvma_isacov.f \
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
	@echo "--- Running Test: $(TEST_NAME) (Seed: $(SEED)) ---"
	$(VSIM) -c ibex_core_tb_top_opt \
	-sv_seed $(SEED) \
	-sv_lib cosim_dpi \
	+UVM_TESTNAME=$(TEST_RTL) \
	+UVM_VERBOSITY=$(VERBOSITY) \
	+HEX_FILE=$(HEX_FILE) \
	+TOHOST_ADDR=$(TOHOST_ADDR) \
	-l $(OUT_DIR)/logs/sim_$(TEST_NAME)_$(SEED).log \
	-do "run -all; exit"

# 5. Graphical Mode (Debug with GUI)
wave: opt
	@echo "--- Opening QuestaSim GUI for $(TEST_NAME) ---"
	$(VSIM) ibex_core_tb_top_opt \
	-sv_seed $(SEED) \
	-sv_lib cosim_dpi \
	+UVM_TESTNAME=$(TEST_RTL) \
	+UVM_VERBOSITY=$(VERBOSITY) \
	+HEX_FILE=$(HEX_FILE) \
	+TOHOST_ADDR=$(TOHOST_ADDR) \
	-do " \
		add wave -group {Instr_Mem_IF} /ibex_core_tb_top/instr_mem_if/*; \
		add wave -group {Ibex_Pins} /ibex_core_tb_top/dut/*; \
		add wave -group {RVFI_Tracer} /ibex_core_tb_top/dut/rvfi_*; \
		add wave -group {RVFI_Interface} /ibex_core_tb_top/dut/rvfi_if_inst/*; \
		run -all"

# 6. Cleanup
clean:
	@echo "--- Cleaning Workspace ---"
	rm -rf $(OUT_DIR) work transcript *.wlf modelsim.ini