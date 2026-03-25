`ifndef __UVMA_ISACOV_CFG_SV__
`define __UVMA_ISACOV_CFG_SV__
  
class uvma_isacov_cfg extends uvm_object;

  // ------------------------------------------------------------------------
  // Chaves Mestras
  // ------------------------------------------------------------------------
  rand bit                     enabled;
  rand bit                     cov_model_enabled;
  rand uvm_active_passive_enum is_active; // Padrão de qualquer Agente UVM
  
  // ------------------------------------------------------------------------
  // Suporte a Extensões (Achatadas do antigo core_cfg)
  // ------------------------------------------------------------------------
  rand bit ext_i_supported;       // Base Integer (RV32I)
  rand bit ext_m_supported;       // Mult/Div
  rand bit ext_c_supported;       // Compressed
  rand bit ext_zicsr_supported;   // CSRs
  rand bit ext_zifencei_supported;// FENCE.I
  
  // ------------------------------------------------------------------------
  // Features Avançadas de Cobertura
  // ------------------------------------------------------------------------
  rand bit reg_hazards_enabled; // Cobrir Read-After-Write (RAW), etc.
  rand bit reg_crosses_enabled; // Cruzar rs1 com rs2

  // ------------------------------------------------------------------------
  // UVM Factory Macros (Essenciais para o randomize() funcionar bem e para prints)
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

  // ------------------------------------------------------------------------
  // Construtor com Valores Padrão Seguros (Default Constraints)
  // ------------------------------------------------------------------------
  function new(string name="uvma_isacov_cfg");
    super.new(name);
    
    // Valores padrão conservadores (para rodar sem precisar chamar randomize)
    enabled                = 1;
    cov_model_enabled      = 1;
    is_active              = UVM_PASSIVE; // Agente de coverage é sempre passivo
    
    ext_i_supported        = 1;
    ext_m_supported        = 0;
    ext_c_supported        = 0;
    ext_zicsr_supported    = 1;
    ext_zifencei_supported = 1;
    
    reg_hazards_enabled    = 1;
    reg_crosses_enabled    = 1;
  endfunction

endclass : uvma_isacov_cfg

`endif // __UVMA_ISACOV_CFG_SV__
