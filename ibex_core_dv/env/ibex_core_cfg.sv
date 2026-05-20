`ifndef __IBEX_CORE_CFG_SV__
`define __IBEX_CORE_CFG_SV__

class ibex_core_cfg extends uvm_object;
  // Signals to control
  rand bit                      enabled;
  rand uvm_active_passive_enum  is_active;
  rand bit                      cov_model_enabled;

  // Signals to cosimulate with Spike
  string     isa_string;
  bit [31:0] start_pc;
  bit [31:0] start_mtvec;
  bit        probe_imem_for_errs;
  bit        relax_cosim_check; // If set, certain cosimulation mismatches (e.g., due to interrupts) will be logged as info instead of errors
  string     log_file;
  bit [31:0] pmp_num_regions;
  bit [31:0] pmp_granularity;
  bit [31:0] mhpm_counter_num;
  bit        secure_ibex;
  bit        icache;
  bit [31:0] dm_start_addr;
  bit [31:0] dm_end_addr;

  // Child agent configurations
  rand uvma_clk_rst_cfg    clk_rst_cfg;
  rand uvma_simple_mem_cfg instr_mem_cfg;
  rand uvma_simple_mem_cfg data_mem_cfg;
  rand uvma_rvfi_cfg       rvfi_cfg;
  rand uvma_isacov_cfg     isacov_cfg;
  rand uvma_interrupt_cfg  interrupt_cfg;

  `uvm_object_utils_begin(ibex_core_cfg)
    `uvm_field_int (                         enabled,   UVM_DEFAULT)
    `uvm_field_int (cov_model_enabled,                  UVM_DEFAULT)
    `uvm_field_enum(uvm_active_passive_enum, is_active, UVM_DEFAULT)

    `uvm_field_string(isa_string,          UVM_DEFAULT)
    `uvm_field_int   (start_pc,            UVM_DEFAULT)
    `uvm_field_int   (start_mtvec,         UVM_DEFAULT)
    `uvm_field_int   (probe_imem_for_errs, UVM_DEFAULT)
    `uvm_field_int   (relax_cosim_check,   UVM_DEFAULT)
    `uvm_field_string(log_file,            UVM_DEFAULT)
    `uvm_field_int   (pmp_num_regions,     UVM_DEFAULT)
    `uvm_field_int   (pmp_granularity,     UVM_DEFAULT)
    `uvm_field_int   (mhpm_counter_num,    UVM_DEFAULT)
    `uvm_field_int   (secure_ibex,         UVM_DEFAULT)
    `uvm_field_int   (icache,              UVM_DEFAULT)
    `uvm_field_int   (dm_start_addr,       UVM_DEFAULT | UVM_HEX)
    `uvm_field_int   (dm_end_addr,         UVM_DEFAULT | UVM_HEX)

    `uvm_field_object(clk_rst_cfg,   UVM_DEFAULT)
    `uvm_field_object(instr_mem_cfg, UVM_DEFAULT)
    `uvm_field_object(data_mem_cfg,  UVM_DEFAULT)
    `uvm_field_object(rvfi_cfg,      UVM_DEFAULT)
    `uvm_field_object(isacov_cfg,    UVM_DEFAULT)
    `uvm_field_object(interrupt_cfg, UVM_DEFAULT)
  `uvm_object_utils_end

  constraint defaults_cons {
    soft enabled           == 1;
    soft is_active         == UVM_ACTIVE;
    soft cov_model_enabled == 1;
  }

  constraint agents_cfg_cons {
    if (enabled) {
      clk_rst_cfg.enabled   == 1;
      instr_mem_cfg.enabled == 1;
      data_mem_cfg.enabled  == 1;
      rvfi_cfg.enabled      == 1;
      isacov_cfg.enabled    == 1;
      interrupt_cfg.enabled == 1;
    }

    if (is_active == UVM_ACTIVE) {
      clk_rst_cfg.is_active   == UVM_ACTIVE;
      instr_mem_cfg.is_active == UVM_ACTIVE;
      data_mem_cfg.is_active  == UVM_ACTIVE;
      rvfi_cfg.is_active      == UVM_PASSIVE; // RVFI agent is typically passive as it only observes
      isacov_cfg.is_active    == UVM_PASSIVE; // ISA coverage agent is typically passive as it only observes
      interrupt_cfg.is_active == UVM_ACTIVE;
    }

    if (cov_model_enabled) {
      isacov_cfg.cov_model_enabled    == 1;
      interrupt_cfg.cov_model_enabled == 1;
    }

    clk_rst_cfg.default_period == 10000; // 100 MHz

    instr_mem_cfg.min_latency  == 0;
    instr_mem_cfg.max_latency  == 2;
    instr_mem_cfg.error_prob   == 0;
    instr_mem_cfg.max_latency  >= instr_mem_cfg.min_latency;

    data_mem_cfg.min_latency   == 0;
    data_mem_cfg.max_latency   == 2;
    data_mem_cfg.error_prob    == 0;
    data_mem_cfg.max_latency   >= data_mem_cfg.min_latency;

    isacov_cfg.ext_i_supported        == 1;
    isacov_cfg.ext_m_supported        == 1;
    isacov_cfg.ext_c_supported        == 1;
    isacov_cfg.ext_zicsr_supported    == 1;
    isacov_cfg.ext_zifencei_supported == 1;
    isacov_cfg.reg_hazards_enabled    == 1;
    isacov_cfg.reg_crosses_enabled    == 1;

    interrupt_cfg.enabled_irq_mask == 32'hFFFF_FFFF; // All interrupts enabled by default
  }

  function new(string name="ibex_core_cfg");
    super.new(name);
    // Instancia todas as sub-configurações
    clk_rst_cfg   = uvma_clk_rst_cfg   ::type_id::create("clk_rst_cfg"  );
    instr_mem_cfg = uvma_simple_mem_cfg::type_id::create("instr_mem_cfg");
    data_mem_cfg  = uvma_simple_mem_cfg::type_id::create("data_mem_cfg" );
    rvfi_cfg      = uvma_rvfi_cfg      ::type_id::create("rvfi_cfg"     );
    isacov_cfg    = uvma_isacov_cfg    ::type_id::create("isacov_cfg"   );
    interrupt_cfg = uvma_interrupt_cfg ::type_id::create("interrupt_cfg");
  endfunction

endclass

`endif // __IBEX_CORE_CFG_SV__
