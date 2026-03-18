`ifndef __UVMA_RVFI_CFG_SV__
`define __UVMA_RVFI_CFG_SV__

class uvma_rvfi_cfg extends uvm_object;
  `uvm_object_utils(uvma_rvfi_cfg)

  // Disjuntor principal
  bit enabled = 1'b1; // Ligado por padrão

  // O RVFI é fisicamente incapaz de ser ACTIVE (não tem Driver)
  // Mas mantemos a variável por padronização UVM
  uvm_active_passive_enum is_active = UVM_PASSIVE; 

  function new(string name="uvma_rvfi_cfg");
    super.new(name);
  endfunction

endclass : uvma_rvfi_cfg

`endif // __UVMA_RVFI_CFG_SV__