`ifndef __UVMA_SIMPLE_MEM_CFG_SV__
`define __UVMA_SIMPLE_MEM_CFG_SV__

class uvma_simple_mem_cfg extends uvm_object;

  rand bit                      enabled;
  rand uvm_active_passive_enum  is_active;
  rand int                      min_latency;
  rand int                      max_latency;

  `uvm_object_utils_begin(uvma_simple_mem_cfg)
    `uvm_field_int (enabled, UVM_DEFAULT)
    `uvm_field_enum(uvm_active_passive_enum, is_active, UVM_DEFAULT)
    `uvm_field_int (min_latency, UVM_DEFAULT + UVM_DEC)
    `uvm_field_int (max_latency, UVM_DEFAULT + UVM_DEC)
  `uvm_object_utils_end

  constraint defaults_cons {
    soft enabled     == 1;
    soft is_active   == UVM_ACTIVE;
    soft min_latency == 0;
    soft max_latency == 2;
    max_latency >= min_latency;
  }

  function new(string name="uvma_simple_mem_cfg");
    super.new(name);
  endfunction

endclass : uvma_simple_mem_cfg

`endif // __UVMA_SIMPLE_MEM_CFG_SV__
