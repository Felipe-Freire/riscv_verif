`ifndef __UVMA_ISACOV_CFG_SV__
`define __UVMA_ISACOV_CFG_SV__
  
class uvma_isacov_cfg extends uvm_object;

  // ------------------------------------------------------------------------
  // Master switches
  // ------------------------------------------------------------------------
  rand bit                     enabled;
  rand bit                     cov_model_enabled;
  rand uvm_active_passive_enum is_active; // Standard setting for any UVM agent
  
  // ------------------------------------------------------------------------
  // Extension support (flattened from former core_cfg)
  // ------------------------------------------------------------------------
  rand bit ext_i_supported;       // Base Integer (RV32I)
  rand bit ext_m_supported;       // Mult/Div
  rand bit ext_c_supported;       // Compressed
  rand bit ext_zicsr_supported;   // CSRs
  rand bit ext_zifencei_supported;// FENCE.I
  
  // ------------------------------------------------------------------------
  // Advanced coverage features
  // ------------------------------------------------------------------------
  rand bit reg_hazards_enabled; // Cover Read-After-Write (RAW), etc.
  rand bit reg_crosses_enabled; // Cross rs1 with rs2

  // ------------------------------------------------------------------------
  // UVM factory macros (essential for randomize() and object prints)
  // ------------------------------------------------------------------------
  `uvm_object_utils_begin(uvma_isacov_cfg)
    `uvm_field_int(enabled,                UVM_DEFAULT)
    `uvm_field_int(cov_model_enabled,      UVM_DEFAULT)
    `uvm_field_enum(uvm_active_passive_enum, is_active, UVM_DEFAULT)
    
    `uvm_field_int(ext_i_supported,        UVM_DEFAULT)
    `uvm_field_int(ext_m_supported,        UVM_DEFAULT)
    `uvm_field_int(ext_c_supported,        UVM_DEFAULT)
    `uvm_field_int(ext_zicsr_supported,    UVM_DEFAULT)
    `uvm_field_int(ext_zifencei_supported, UVM_DEFAULT)
    
    `uvm_field_int(reg_hazards_enabled,    UVM_DEFAULT)
    `uvm_field_int(reg_crosses_enabled,    UVM_DEFAULT)
  `uvm_object_utils_end

  constraint defaults_cons {
    soft enabled                == 1;
    soft cov_model_enabled      == 1;
    soft is_active              == UVM_PASSIVE; // Coverage agent is always passive
    
    soft ext_i_supported        == 1;
    soft ext_m_supported        == 1;
    soft ext_c_supported        == 1;
    soft ext_zicsr_supported    == 1;
    soft ext_zifencei_supported == 1;
    
    soft reg_hazards_enabled    == 1;
    soft reg_crosses_enabled    == 1;
  }

  // ------------------------------------------------------------------------
  // Constructor with safe default values (default constraints)
  // ------------------------------------------------------------------------
  function new(string name="uvma_isacov_cfg");
    super.new(name);
  endfunction

endclass : uvma_isacov_cfg

`endif // __UVMA_ISACOV_CFG_SV__
