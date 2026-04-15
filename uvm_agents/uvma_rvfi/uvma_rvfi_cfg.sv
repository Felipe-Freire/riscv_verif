`ifndef __UVMA_RVFI_CFG_SV__
`define __UVMA_RVFI_CFG_SV__

class uvma_rvfi_cfg extends uvm_object;

  // Main enable switch
  rand bit enabled;
  rand uvm_active_passive_enum is_active; 

  `uvm_object_utils_begin(uvma_rvfi_cfg)
    `uvm_field_int (enabled, UVM_DEFAULT)
    `uvm_field_enum(uvm_active_passive_enum, is_active, UVM_DEFAULT)
  `uvm_object_utils_end

  constraint defaults_cons {
    soft enabled   == 1;
    soft is_active == UVM_PASSIVE; // RVFI agent is typically passive
  }

  function new(string name="uvma_rvfi_cfg");
    super.new(name);
  endfunction

endclass : uvma_rvfi_cfg

`endif // __UVMA_RVFI_CFG_SV__
