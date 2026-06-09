// ==============================================================================
// tb_top.cpp — Verilator C++ Testbench for Ibex (RV32IMC)
// ==============================================================================
// This is the lightweight C++ entry point for the Verilator simulation track.
// It replaces the full UVM environment with direct C++ driving of:
//   - Clock / Reset generation
//   - Zero-wait-state instruction + data memory model
//   - RVFI-based lockstep checking via the same DPI-C Spike cosim functions
//   - Tohost-based test termination
//
// Usage:
//   ./obj_dir/Vibex_core_tb_top_verilator +HEX_FILE=path.hex +TOHOST_ADDR=80001000
// ==============================================================================

#include <iostream>
#include <iomanip>
#include <fstream>
#include <sstream>
#include <string>
#include <cstdint>
#include <cstring>
#include <map>
#include <vector>

// Verilator headers
#include "Vibex_core_tb_top_verilator.h"
#include "verilated.h"

// Coverage support (enabled when compiled with --coverage)
#ifdef VM_COVERAGE
#include "verilated_cov.h"
#endif

// Spike DPI-C interface — same extern "C" functions from cosim_dpi.cpp
extern "C" {
  void* riscv_cosim_init(const char* isa, int start_pc);
  void  riscv_cosim_write_mem_byte(void* handle, int addr, char data);
  int   riscv_cosim_step(void* handle, int rd, int wdata, int pc, int trap, int intr);
  void  riscv_cosim_set_interrupt(void* handle, int mask, int val);
  int   riscv_cosim_get_num_errors(void* handle);
  const char* riscv_cosim_get_error(void* handle, int index);
  void  riscv_cosim_clear_errors(void* handle);
}

// ==============================================================================
// Paged Memory Model (4KB pages, zero-wait-state)
// ==============================================================================
class MemoryModel {
public:
  void write_byte(uint32_t addr, uint8_t data) {
    uint32_t page = addr & ~0xFFFu;
    if (pages_.find(page) == pages_.end()) {
      pages_[page].resize(4096, 0);
    }
    pages_[page][addr & 0xFFF] = data;
  }

  uint8_t read_byte(uint32_t addr) const {
    uint32_t page = addr & ~0xFFFu;
    auto it = pages_.find(page);
    if (it != pages_.end()) {
      return it->second[addr & 0xFFF];
    }
    return 0;
  }

  uint32_t read_word(uint32_t addr) const {
    uint32_t val = 0;
    for (int i = 0; i < 4; i++) {
      val |= static_cast<uint32_t>(read_byte(addr + i)) << (8 * i);
    }
    return val;
  }

  void write_word(uint32_t addr, uint32_t data, uint8_t be) {
    for (int i = 0; i < 4; i++) {
      if (be & (1 << i)) {
        write_byte(addr + i, (data >> (8 * i)) & 0xFF);
      }
    }
  }

private:
  std::map<uint32_t, std::vector<uint8_t>> pages_;
};

// ==============================================================================
// Verilog HEX File Parser (objcopy -O verilog format)
// ==============================================================================
// Format:
//   @XXXXXXXX         <-- set base address (hex)
//   XX XX XX XX ...   <-- data bytes (hex, space-separated)
//
static bool load_hex_file(const std::string& path, MemoryModel& mem, void* spike) {
  std::ifstream ifs(path);
  if (!ifs.is_open()) {
    std::cerr << "[TB] ERROR: Cannot open HEX file: " << path << std::endl;
    return false;
  }

  uint32_t addr = 0;
  std::string line;
  size_t total_bytes = 0;

  while (std::getline(ifs, line)) {
    // Strip carriage return if present
    if (!line.empty() && line.back() == '\r') {
      line.pop_back();
    }
    if (line.empty()) continue;

    if (line[0] == '@') {
      // Address directive
      addr = std::stoul(line.substr(1), nullptr, 16);
    } else {
      // Data bytes
      std::istringstream iss(line);
      std::string byte_str;
      while (iss >> byte_str) {
        uint8_t byte_val = static_cast<uint8_t>(std::stoul(byte_str, nullptr, 16));
        mem.write_byte(addr, byte_val);
        riscv_cosim_write_mem_byte(spike, static_cast<int>(addr),
                                   static_cast<char>(byte_val));
        addr++;
        total_bytes++;
      }
    }
  }

  std::cout << "[TB] Loaded " << total_bytes << " bytes from " << path << std::endl;
  return total_bytes > 0;
}

// ==============================================================================
// Plusarg Helpers
// ==============================================================================
static std::string get_plusarg_string(const char* name) {
  std::string prefix = std::string("+") + name + "=";
  std::string result;
  if (Verilated::commandArgsPlusMatch(name)) {
    const char* val = Verilated::commandArgsPlusMatch(name);
    // val is "+NAME=VALUE", extract VALUE
    std::string full(val);
    size_t eq = full.find('=');
    if (eq != std::string::npos) {
      result = full.substr(eq + 1);
    }
  }
  return result;
}

static uint64_t get_plusarg_uint(const char* name, uint64_t default_val) {
  std::string val = get_plusarg_string(name);
  if (val.empty()) return default_val;
  return std::stoull(val, nullptr, 16);
}

// ==============================================================================
// Main Simulation Loop
// ==============================================================================
int main(int argc, char** argv) {
  // ---- Verilator Setup ----
  Verilated::commandArgs(argc, argv);
  Verilated::traceEverOn(false);

  auto* top = new Vibex_core_tb_top_verilator;

  // ---- Parse Plusargs ----
  std::string hex_file  = get_plusarg_string("HEX_FILE");
  uint32_t tohost_addr  = static_cast<uint32_t>(get_plusarg_uint("TOHOST_ADDR", 0x80001000));
  uint64_t max_cycles   = get_plusarg_uint("MAX_CYCLES", 10000000);  // 10M default

  if (hex_file.empty()) {
    std::cerr << "[TB] ERROR: +HEX_FILE=<path> is required." << std::endl;
    delete top;
    return 1;
  }

  std::cout << "[TB] ============================================" << std::endl;
  std::cout << "[TB] Ibex Verilator Testbench" << std::endl;
  std::cout << "[TB] HEX File   : " << hex_file << std::endl;
  std::cout << "[TB] TOHOST Addr: 0x" << std::hex << tohost_addr << std::dec << std::endl;
  std::cout << "[TB] Max Cycles : " << max_cycles << std::endl;
  std::cout << "[TB] ============================================" << std::endl;

  // ---- Initialize Spike ISS (same as UVM cosim_dpi.cpp) ----
  // Boot address 0x80000000, ISA rv32imc, Machine mode
  void* spike = riscv_cosim_init("rv32imc", 0x80000000);
  if (!spike) {
    std::cerr << "[TB] ERROR: Spike ISS initialization failed." << std::endl;
    delete top;
    return 1;
  }

  // ---- Memory Model ----
  MemoryModel mem;

  // ---- Load HEX into Memory + Spike ----
  if (!load_hex_file(hex_file, mem, spike)) {
    std::cerr << "[TB] ERROR: Failed to load HEX file." << std::endl;
    delete top;
    return 1;
  }

  // ---- Simulation State ----
  uint64_t cycle_count    = 0;
  uint64_t instr_count    = 0;
  uint64_t mismatch_count = 0;
  bool     test_passed    = false;
  bool     test_finished  = false;

  // Memory pipeline state (1-cycle latency for rvalid)
  bool     instr_pending  = false;
  uint32_t instr_pending_addr = 0;
  bool     data_pending   = false;
  uint32_t data_pending_addr = 0;
  bool     data_pending_we = false;
  uint32_t data_pending_wdata = 0;
  uint8_t  data_pending_be = 0;

  // ---- Reset Sequence (100 cycles) ----
  top->rst_ni = 0;
  top->clk_i  = 0;
  top->instr_gnt_i       = 0;
  top->instr_rvalid_i    = 0;
  top->instr_rdata_i     = 0;
  top->instr_rdata_intg_i = 0;
  top->instr_err_i       = 0;
  top->data_gnt_i        = 0;
  top->data_rvalid_i     = 0;
  top->data_rdata_i      = 0;
  top->data_rdata_intg_i = 0;
  top->data_err_i        = 0;
  top->irq_software_i    = 0;
  top->irq_timer_i       = 0;
  top->irq_external_i    = 0;
  top->irq_fast_i        = 0;
  top->irq_nm_i          = 0;

  for (int i = 0; i < 100; i++) {
    top->clk_i = 0; top->eval();
    top->clk_i = 1; top->eval();
  }
  top->rst_ni = 1;
  std::cout << "[TB] Reset de-asserted at cycle 100." << std::endl;

  // ---- Main Simulation Loop ----
  while (!Verilated::gotFinish() && cycle_count < max_cycles && !test_finished) {

    // ======================== FALLING EDGE ========================
    top->clk_i = 0;
    top->eval();

    // ======================== RISING EDGE ========================
    // Update memory model inputs BEFORE the rising edge.
    // This models combinational grant + 1-cycle rvalid response.

    // --- Instruction Memory: respond to previous cycle's pending request ---
    if (instr_pending) {
      top->instr_rvalid_i = 1;
      top->instr_rdata_i  = mem.read_word(instr_pending_addr);
      top->instr_err_i    = 0;
      instr_pending = false;
    } else {
      top->instr_rvalid_i = 0;
      top->instr_rdata_i  = 0;
    }

    // --- Data Memory: respond to previous cycle's pending request ---
    if (data_pending) {
      top->data_rvalid_i = 1;
      top->data_err_i    = 0;
      if (data_pending_we) {
        // Write: commit to memory, return 0 on rdata
        mem.write_word(data_pending_addr, data_pending_wdata, data_pending_be);
        top->data_rdata_i = 0;
      } else {
        // Read: return memory contents
        top->data_rdata_i = mem.read_word(data_pending_addr);
      }
      data_pending = false;
    } else {
      top->data_rvalid_i = 0;
      top->data_rdata_i  = 0;
    }

    // --- Accept new instruction requests (combinational grant) ---
    if (top->instr_req_o) {
      top->instr_gnt_i = 1;
      instr_pending = true;
      instr_pending_addr = top->instr_addr_o;
    } else {
      top->instr_gnt_i = 0;
    }

    // --- Accept new data requests (combinational grant) ---
    if (top->data_req_o) {
      top->data_gnt_i    = 1;
      data_pending       = true;
      data_pending_addr  = top->data_addr_o;
      data_pending_we    = top->data_we_o;
      data_pending_wdata = top->data_wdata_o;
      data_pending_be    = top->data_be_o;

      // --- TOHOST Detection (check on data write) ---
      if (top->data_we_o && top->data_addr_o == tohost_addr) {
        uint32_t tohost_val = top->data_wdata_o;
        if (tohost_val == 1) {
          test_passed  = true;
          test_finished = true;
          std::cout << "[TB] *** TEST PASSED! (via TOHOST) ***" << std::endl;
        } else if (tohost_val != 0) {
          test_passed  = false;
          test_finished = true;
          std::cerr << "[TB] *** TEST FAILED! (TOHOST = 0x"
                    << std::hex << tohost_val << std::dec << ") ***" << std::endl;
        }
      }
    } else {
      top->data_gnt_i = 0;
    }

    // Rising edge evaluation
    top->clk_i = 1;
    top->eval();

    // ======================== RVFI LOCKSTEP CHECK ========================
    if (top->rvfi_valid_o) {
      uint32_t rd_addr  = top->rvfi_rd_addr_o;
      uint32_t rd_wdata = top->rvfi_rd_wdata_o;
      uint32_t pc       = top->rvfi_pc_rdata_o;
      uint32_t trap     = top->rvfi_trap_o ? 1 : 0;
      uint32_t intr     = top->rvfi_intr_o ? 1 : 0;

      int result = riscv_cosim_step(spike,
        static_cast<int>(rd_addr),
        static_cast<int>(rd_wdata),
        static_cast<int>(pc),
        static_cast<int>(trap),
        static_cast<int>(intr));

      instr_count++;

      if (result == 0) {
        // Mismatch detected
        mismatch_count++;
        int num_errors = riscv_cosim_get_num_errors(spike);
        for (int i = 0; i < num_errors; i++) {
          std::cerr << "[TB] COSIM ERROR: " << riscv_cosim_get_error(spike, i) << std::endl;
        }
        riscv_cosim_clear_errors(spike);

        // Print RVFI context for debugging
        std::cerr << "[TB] RVFI Context: PC=0x" << std::hex << pc
                  << " INSN=0x" << top->rvfi_insn_o
                  << " RD[x" << std::dec << rd_addr << "]=0x"
                  << std::hex << rd_wdata
                  << " TRAP=" << trap << " INTR=" << intr
                  << std::dec << std::endl;

        // Abort after too many mismatches
        if (mismatch_count >= 10) {
          std::cerr << "[TB] *** ABORTING: Too many mismatches (" << mismatch_count << ") ***"
                    << std::endl;
          test_finished = true;
        }
      }
    }

    cycle_count++;
  }

  // ---- Final Report ----
  std::cout << std::endl;
  std::cout << "[TB] ============================================" << std::endl;
  std::cout << "[TB] Simulation Complete" << std::endl;
  std::cout << "[TB] Total Cycles       : " << cycle_count << std::endl;
  std::cout << "[TB] Instructions Retired: " << instr_count << std::endl;
  std::cout << "[TB] Cosim Mismatches   : " << mismatch_count << std::endl;

  if (!test_finished && cycle_count >= max_cycles) {
    std::cerr << "[TB] *** TEST FAILED! (TIMEOUT at " << max_cycles << " cycles) ***" << std::endl;
    test_passed = false;
  }

  if (test_passed && mismatch_count == 0) {
    std::cout << "[TB] *** VERDICT: PASS ***" << std::endl;
  } else {
    std::cout << "[TB] *** VERDICT: FAIL ***" << std::endl;
  }
  std::cout << "[TB] ============================================" << std::endl;

  // ---- Coverage Dump ----
#ifdef VM_COVERAGE
  std::string cov_file = "coverage.dat";
  std::string cov_arg = get_plusarg_string("COV_FILE");
  if (!cov_arg.empty()) cov_file = cov_arg;
  std::cout << "[TB] Writing coverage to: " << cov_file << std::endl;
  VerilatedCov::write(cov_file.c_str());
#endif

  // ---- Cleanup ----
  top->final();
  delete top;

  return (test_passed && mismatch_count == 0) ? 0 : 1;
}
