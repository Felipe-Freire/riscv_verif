#ifndef COSIM_DPI_H
#define COSIM_DPI_H

#include <cstdint>
#include <string>
#include <vector>
#include <map>
#include "riscv/processor.h"
#include "riscv/simif.h"
#include "riscv/cfg.h"

// Spike co-simulation adapter. This class implements simif_t so Spike can
// fetch/store bytes through the virtual memory map managed by the testbench.
class MySpikeCosim : public simif_t {
private:
    processor_t* proc;
    cfg_t* cfg;

    // Spike's simif_t API expects all available harts to be discoverable.
    std::map<size_t, processor_t*> harts;

    // Sparse byte-addressable memory model used for MMIO-backed accesses.
    std::map<uint32_t, uint8_t> memory;
    
    // Error queue consumed by the UVM side through DPI.
    std::vector<std::string> errors;

public:
    MySpikeCosim(const char* isa_str, uint32_t start_pc);
    ~MySpikeCosim();

    void write_mem_byte(uint32_t addr, uint8_t data);
    int step(uint32_t rd_addr, uint32_t rd_wdata, uint32_t rtl_pc, uint32_t trap);
    int get_num_errors();
    const char* get_error(int index);
    void clear_errors();

    virtual const cfg_t& get_cfg() const override { return *cfg; }
    virtual const std::map<size_t, processor_t*>& get_harts() const override { return harts; }
    virtual char* addr_to_mem(reg_t addr) override { return nullptr; } // Force MMIO callbacks for all accesses.
    virtual bool mmio_load(reg_t addr, size_t len, uint8_t* bytes) override;
    virtual bool mmio_store(reg_t addr, size_t len, const uint8_t* bytes) override;
    virtual void proc_reset(unsigned id) override {}
    virtual const char* get_symbol(uint64_t addr) override { return nullptr; }
};

#endif // COSIM_DPI_H
