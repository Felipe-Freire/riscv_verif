#include "cosim_dpi.h"
#include <iostream>
#include <sstream>
#include <iomanip>
#include "riscv/csrs.h"

// Initialization
MySpikeCosim::MySpikeCosim(const char* isa_str, uint32_t start_pc) {
  cfg = new cfg_t();

  // Spike core instantiation
  proc = new processor_t(isa_str, "M", (const cfg_t*)cfg, this, 0, false, (FILE*)nullptr, std::cerr);
  harts[0] = proc;

  // Reset and initialize PC
  proc->reset();
  proc->get_state()->pc = start_pc;

  std::cout << "[C++] Spike ISS (ISA: " << isa_str << ") PC init: 0x" 
            << std::hex << start_pc << std::dec << "\n";
}

MySpikeCosim::~MySpikeCosim() {
  delete proc;
  delete cfg;
}

// Paged Memory Subsystem
void MySpikeCosim::write_mem_byte(uint32_t addr, uint8_t data) {
  uint32_t page_addr = addr & ~0xFFF; // Page Base Address (4KB aligned)

  // Se a página não existe, aloca 4KB zerados na memória do computador
  if (memory_pages.find(page_addr) == memory_pages.end()) {
    memory_pages[page_addr] = std::vector<uint8_t>(4096, 0); 
  }

  // Grava o dado no offset exato da página
  memory_pages[page_addr][addr & 0xFFF] = data;
}

// O Segredo: Retorna ponteiros C++ válidos, transformando a região em RAM Oficial
char* MySpikeCosim::addr_to_mem(reg_t addr) {
  uint32_t page_addr = addr & ~0xFFF;
  if (memory_pages.find(page_addr) != memory_pages.end()) {
    return (char*)&memory_pages[page_addr][addr & 0xFFF]; 
  }
  return nullptr; // Se a página não existe, devolve pro MMIO do Spike
}

// Load Implementation
bool MySpikeCosim::mmio_load(reg_t addr, size_t len, uint8_t* bytes) {
  for (size_t i = 0; i < len; ++i) {
    uint32_t current_addr = addr + i;
    uint32_t page_addr = current_addr & ~0xFFF;

    if (memory_pages.find(page_addr) != memory_pages.end()) {
      bytes[i] = memory_pages[page_addr][current_addr & 0xFFF];
    } else {
      bytes[i] = 0; // Regiões não alocadas retornam 0
    }
  }
  return true;
}

// Store Implementation
bool MySpikeCosim::mmio_store(reg_t addr, size_t len, const uint8_t* bytes) {
  for (size_t i = 0; i < len; ++i) {
    write_mem_byte(addr + i, bytes[i]);
  }
  return true;
}

// Lockstep Checker
int MySpikeCosim::step(uint32_t rd_addr, uint32_t rd_wdata, uint32_t rtl_pc, uint32_t trap, uint32_t intr) {
  bool passed = true;
  std::stringstream err_msg;

  uint32_t current_mtvec = proc->get_csr(CSR_MTVEC);
  proc->put_csr(CSR_MTVEC, current_mtvec & 0xFFFFFF03);

  if (intr == 1) {
    proc->step(1);
  }

  // PC Sincronization Check
  uint32_t spike_pc = proc->get_state()->pc;

  if (intr == 0 && trap == 0) {
    if (spike_pc != rtl_pc) {
      err_msg << "PC mismatch! RTL executed 0x" << std::hex << rtl_pc
              << " but Spike expected 0x" << spike_pc;
      errors.push_back(err_msg.str());
      return 0; // Divergência Crítica
    }
  }

  // Step Spike for one instruction
  proc->step(1);

  // Compare Register Write-Backs
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

// TODO: Implement support for custom/fast interrupts for Ibex.
// Currently recognizes the pattern IRQ_SOFTWARE_ID = 3, IRQ_TIMER_ID = 7, IRQ_EXTERNAL_ID = 11;

// Set Interrupt
void MySpikeCosim::set_interrupt(uint32_t mask, uint32_t val) {
  // uint32_t current_mtvec = proc->get_csr(CSR_MTVEC);
  // proc->put_csr(CSR_MTVEC, current_mtvec & 0xFFFFFF03);
  // std::cout << "[DEBUG] Spike MTVEC is: 0x" << std::hex << current_mtvec << std::endl;
  proc->get_state()->mip->backdoor_write_with_mask(0xffffffff, val);
  // proc->step(1);
}

// Error Management
int MySpikeCosim::get_num_errors() { return errors.size(); }
const char* MySpikeCosim::get_error(int index) { return errors[index].c_str(); }
void MySpikeCosim::clear_errors() { errors.clear(); }

// DPI-C Exports
extern "C" {
  void* riscv_cosim_init(const char* isa, int start_pc) {
    return (void*)(new MySpikeCosim(isa, start_pc));
  }

  void riscv_cosim_write_mem_byte(void* handle, int addr, char data) {
    ((MySpikeCosim*)handle)->write_mem_byte(addr, (uint8_t)data);
  }

  int riscv_cosim_step(void* handle, int rd, int wdata, int pc, int trap, int intr) {
    return ((MySpikeCosim*)handle)->step(rd, wdata, pc, trap, intr);
  }

  void riscv_cosim_set_interrupt(void* handle, int mask, int val) {
    ((MySpikeCosim*)handle)->set_interrupt(mask, val);
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