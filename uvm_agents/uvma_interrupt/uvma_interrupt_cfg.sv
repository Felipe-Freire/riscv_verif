`ifndef __UVMA_INTERRUPT_CFG_SV__
`define __UVMA_INTERRUPT_CFG_SV__

class uvma_interrupt_cfg extends uvm_object;

  // Chaves Mestras
  rand bit                     enabled;
  rand uvm_active_passive_enum is_active;
  rand bit                     cov_model_enabled;
  
  // Máscara de interrupções permitidas (1 = habilitada, 0 = ignorada)
  rand bit [31:0]              enabled_irq_mask; 
  
  `uvm_object_utils_begin(uvma_interrupt_cfg)
    `uvm_field_int (enabled,               UVM_DEFAULT)
    `uvm_field_enum(uvm_active_passive_enum, is_active, UVM_DEFAULT)   
    `uvm_field_int (cov_model_enabled,     UVM_DEFAULT)
    `uvm_field_int (enabled_irq_mask,      UVM_DEFAULT)         
  `uvm_object_utils_end
  
  // Constraints para quando randomize() for chamado
  constraint defaults_cons {   
    soft enabled           == 1;
    soft is_active         == UVM_ACTIVE; // Agente de interrupção nasce ativo por padrão
    soft cov_model_enabled == 1;
    soft enabled_irq_mask  == 32'hFFFF_FFFF;
  }
  
  // Construtor: Garantia de vida (Valores Default Seguros)
  function new(string name="uvma_interrupt_cfg");
    super.new(name);
    
    this.enabled           = 1;
    this.is_active         = UVM_ACTIVE;
    this.cov_model_enabled = 1;
    this.enabled_irq_mask  = 32'hFFFF_FFFF;
  endfunction

endclass : uvma_interrupt_cfg

`endif // __UVMA_INTERRUPT_CFG_SV__

