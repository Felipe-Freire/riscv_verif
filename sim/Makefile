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
COSIM_DIR  := $(ROOT_DIR)/rtl/ibex/dv/cosim
COSIM_COMM := $(ROOT_DIR)/rtl/ibex/dv/uvm/core_ibex/common/ibex_cosim_agent
OUT_DIR    := ./out

# --- EXPORTS for .f files to see ---
export IBEX_CORE_ENV_PATH   := $(ENV_DIR)
export IBEX_CORE_TEST_PATH  := $(TESTS_DIR)
export UVMA_CLK_RST_PATH 		:= $(ROOT_DIR)/uvm_agents/uvma_clk_rst
export UVMA_SIMPLE_MEM_PATH := $(ROOT_DIR)/uvm_agents/uvma_simple_mem
export UVMA_RVFI_PATH     	:= $(ROOT_DIR)/uvm_agents/uvma_rvfi
export UVMA_INTERRUPT_PATH  := $(ROOT_DIR)/uvm_agents/uvma_interrupt
export UVMA_ISACOV_PATH     := $(ROOT_DIR)/uvm_agents/uvma_isacov
export UVML_MEM_PATH     		:= $(ROOT_DIR)/uvm_libs/uvml_mem
export IBEX_RTL_PATH     		:= $(ROOT_DIR)/rtl/ibex/rtl
# export UVMA_SIMPLE_MEM_PATH := $(ROOT_DIR)/uvm_agents/uvma_simple_mem

# --- Tools ---
# Suppressing Ibex RTL warnings
# VLOG      := vlog -64 -sv +acc -L mtiUvm -suppress 13314,2583
# VOPT      := vopt -64 +acc -suppress 13314,2583
VLOG      := vlog -64 -sv +acc -L mtiUvm
VOPT      := vopt -64 +acc +cover=bcesf+ibex_core_tb_top. -coveropt 3
VSIM      := vsim -64 -L mtiUvm

# --- DPI-C Config ---
MTI_HOME   			 ?= /home/felipe/mentor_graphics_eda/questasim
COSIM_SPIKE_PATH ?= /opt/lowrisc_spike_cosim
CXX        			 := g++

CXXFLAGS 				 := -shared -fPIC -std=c++17 \
										-DRISCV_ENABLE_COMMITLOG \
										-I$(MTI_HOME)/include \
										-I$(COSIM_SPIKE_PATH)/include \
										-I$(COSIM_SPIKE_PATH)/include/softfloat \
										-I$(COSIM_SPIKE_PATH)/include/riscv \
										-I$(COSIM_SPIKE_PATH)/include/fesvr

LDFLAGS  				 := $(COSIM_SPIKE_PATH)/lib/libriscv.a \
                    $(COSIM_SPIKE_PATH)/lib/libfesvr.a \
                    $(COSIM_SPIKE_PATH)/lib/libdisasm.a \
                    $(COSIM_SPIKE_PATH)/lib/libfdt.a

# These macros align the RTL, UVM, and Spike with the riscv-dv memory map.
ARCH_DEFINES := +define+DM_ADDR=1A11_0000 \
                +define+DM_ADDR_MASK=0000_0FFF \
                +define+BOOT_ADDR=8000_0000 \
                +define+DEBUG_MODE_HALT_ADDR=8000_0000 \
                +define+DEBUG_MODE_EXCEPTION_ADDR=8000_0008

# --- Targets ---
.PHONY: all setup comp opt run wave clean

all: comp opt run

# 1. Create output directories and ModelSim work library
setup:
	@mkdir -p $(OUT_DIR)/logs
	@mkdir -p $(OUT_DIR)/waves
	@mkdir -p $(OUT_DIR)/cov
	@if [ ! -d "work" ]; then vlib work; vmap work work; fi

dpi: setup
	@echo "--- Compiling C++ Wrapper for DPI-C ---"
	$(CXX) $(CXXFLAGS) -I$(COSIM_DIR) $(COSIM_DIR)/*.cc -I$(COSIM_COMM) $(COSIM_COMM)/spike_cosim_dpi.cc $(LDFLAGS) -o cosim_dpi.so

# 2. Compilation (RTL -> Agents -> Env -> Tests -> Top)
comp: dpi
	@echo "--- Compiling Design and Verification ---"
	$(VLOG) \
	$(ARCH_DEFINES) \
	+define+RVFI \
	+define+INC_ASSERT \
	+incdir+$(VENDOR_DIR)/ip/prim/rtl \
	+incdir+$(VENDOR_DIR)/dv/sv/dv_utils \
	+incdir+$(COSIM_DIR) \
	+incdir+$(COSIM_COMM) \
	-f ./ibex_core_rtl.f \
	-f $(UVMA_CLK_RST_PATH)/uvma_clk_rst.f \
	-f $(UVML_MEM_PATH)/uvml_mem.f \
	-f $(UVMA_SIMPLE_MEM_PATH)/uvma_simple_mem.f \
	-f $(UVMA_RVFI_PATH)/uvma_rvfi.f \
	-f $(UVMA_INTERRUPT_PATH)/uvma_interrupt.f \
	-f $(UVMA_ISACOV_PATH)/uvma_isacov.f \
	-f $(IBEX_CORE_ENV_PATH)/ibex_core_env.f \
	-f $(IBEX_CORE_TEST_PATH)/ibex_core_test.f \
	$(TB_DIR)/ibex_core_tb_top.sv \
	-l $(OUT_DIR)/logs/compile.log

# 3. Optimization (Required in Questa for performance and signal visibility)
opt: comp
	@echo "--- Optimizing ---"
	$(VOPT) ibex_core_tb_top -o ibex_core_tb_top_opt -l $(OUT_DIR)/logs/opt.log

# 4. Simulation (CLI / Batch Mode)
run:
	@echo "--- Running Test: $(TEST_NAME) (Seed: $(SEED)) ---"
	$(VSIM) -c ibex_core_tb_top_opt \
	-sv_seed $(SEED) \
	-sv_lib cosim_dpi \
	-coverage \
	+UVM_TESTNAME=$(TEST_RTL) \
	+UVM_VERBOSITY=$(VERBOSITY) \
	+HEX_FILE=$(HEX_FILE) \
	+TOHOST_ADDR=$(TOHOST_ADDR) \
	+UVM_TIMEOUT=1000000000ns,YES \
	-l $(OUT_DIR)/logs/sim_$(TEST_NAME)_$(SEED).log \
	-do "coverage save -onexit $(OUT_DIR)/cov/sim_$(TEST_NAME)_$(SEED).ucdb; run -all; exit"

# 5. Graphical Mode (Debug with GUI)
wave:
	@echo "--- Opening QuestaSim GUI for $(TEST_NAME) ---"
	$(VSIM) ibex_core_tb_top_opt \
	-sv_seed $(SEED) \
	-sv_lib cosim_dpi \
	+UVM_TESTNAME=$(TEST_RTL) \
	+UVM_VERBOSITY=$(VERBOSITY) \
	+HEX_FILE=$(HEX_FILE) \
	+TOHOST_ADDR=$(TOHOST_ADDR) \
	+UVM_TIMEOUT=100000000000ns,YES \
	-do " \
		add wave -group {Instr_Mem_IF} /ibex_core_tb_top/instr_mem_if/*; \
		add wave -group {Ibex_Pins} /ibex_core_tb_top/dut/*; \
		add wave -group {RVFI_Tracer} /ibex_core_tb_top/dut/rvfi_*; \
		add wave -group {RVFI_Interface} /ibex_core_tb_top/dut/rvfi_if_inst/*; \
		run -all"

# 6. Coverage Merge and Report
cov_merge:
	@echo "--- Merging UCDB files ---"
	vcover merge -out $(OUT_DIR)/cov/merged_regression.ucdb $(OUT_DIR)/cov/*.ucdb

cov_report: cov_merge
	@echo "--- Generating HTML Coverage Report ---"
	vcover report -html -htmldir $(OUT_DIR)/cov/html_report -source -details $(OUT_DIR)/cov/merged_regression.ucdb

cov_gui:
	@echo "--- Opening Unified Coverage in QuestaSim GUI ---"
	$(VSIM) -viewcov $(OUT_DIR)/cov/merged_regression.ucdb

# 7. Cleanup
clean:
	@echo "--- Cleaning Workspace ---"
	rm -rf $(OUT_DIR) work transcript *.wlf modelsim.ini