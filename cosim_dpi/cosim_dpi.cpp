#include "cosim_dpi.h"
#include <iostream>
#include <sstream>
#include <iomanip>

// Initialization
MySpikeCosim::MySpikeCosim(const char* isa_str, uint32_t start_pc) {
  cfg = new cfg_t();
  
  // Build a single-hart Spike core connected to this simif_t adapter.
  proc = new processor_t(isa_str,
                         "M",
                         (const cfg_t*)cfg,
                         this, 
                         0, 
                         false, 
                         (FILE*)nullptr, 
                         std::cerr);

  harts[0] = proc;

  proc->get_state()->pc = start_pc;
  
  std::cout << "[C++] Spike oracle (ISA: " << isa_str << ") initialized at PC: 0x"
            << std::hex << start_pc << std::dec << "\n";
}

MySpikeCosim::~MySpikeCosim() {
  delete proc;
  delete cfg;
}

// Memory Model
void MySpikeCosim::write_mem_byte(uint32_t addr, uint8_t data) {
  memory[addr] = data;
}

bool MySpikeCosim::mmio_load(reg_t addr, size_t len, uint8_t* bytes) {
  for (size_t i = 0; i < len; ++i) {
    bytes[i] = memory[addr + i]; // std::map default-initializes missing bytes to 0.
  }
  return true;
}

bool MySpikeCosim::mmio_store(reg_t addr, size_t len, const uint8_t* bytes) {
  for (size_t i = 0; i < len; ++i) {
    memory[addr + i] = bytes[i];
  }
  return true;
}

// Lockstep Checker
int MySpikeCosim::step(uint32_t rd_addr, uint32_t rd_wdata, uint32_t rtl_pc, uint32_t trap) {
  bool passed = true;
  std::stringstream err_msg;

  // Validate pre-step PC alignment between RTL and Spike.
  uint32_t spike_pc = proc->get_state()->pc;
  if (spike_pc != rtl_pc) {
    err_msg << "PC mismatch! RTL executed 0x" << std::hex << rtl_pc
            << " but Spike expected 0x" << spike_pc;
    errors.push_back(err_msg.str());
    return 0; // Fatal divergence: skip step to preserve debug context
  }

  // Execute one Spike instruction.
  proc->step(1);

  // Compare architectural writeback when RTL reports a committed GPR write.
  if (rd_addr != 0 && trap == 0) {
    uint32_t spike_wdata = proc->get_state()->XPR[rd_addr];
    if (spike_wdata != rd_wdata) {
      err_msg << "Data mismatch at PC 0x" << std::hex << rtl_pc
              << " | Reg[x" << std::dec << rd_addr << "] -> RTL: 0x"
              << std::hex << rd_wdata << " | Spike: 0x" << spike_wdata;
      errors.push_back(err_msg.str());
      passed = false;
    }
  }

  return passed ? 1 : 0;
}

// Error Reporting API
int MySpikeCosim::get_num_errors() { return errors.size(); }
const char* MySpikeCosim::get_error(int index) { return errors[index].c_str(); }
void MySpikeCosim::clear_errors() { errors.clear(); }

// =========================================================================
// DPI-C boundary consumed from SystemVerilog.
// =========================================================================
extern "C" {
  void* riscv_cosim_init(const char* isa, int start_pc) {
    return (void*)(new MySpikeCosim(isa, start_pc));
  }

  void riscv_cosim_write_mem_byte(void* handle, int addr, char data) {
    ((MySpikeCosim*)handle)->write_mem_byte(addr, (uint8_t)data);
  }

  int riscv_cosim_step(void* handle, int rd, int wdata, int pc, int trap) {
    return ((MySpikeCosim*)handle)->step(rd, wdata, pc, trap);
  }

  int riscv_cosim_get_num_errors(void* handle) {
    return ((MySpikeCosim*)handle)->get_num_errors();
  }

  const char* riscv_cosim_get_error(void* handle, int index) {
    return ((MySpikeCosim*)handle)->get_error(index);
  }

  void riscv_cosim_clear_errors(void* handle) {
    ((MySpikeCosim*)handle)->clear_errors();
  }
}