`ifndef __UVMA_INTERRUPT_CNTXT_SV__
`define __UVMA_INTERRUPT_CNTXT_SV__

class uvma_interrupt_cntxt extends uvm_object;
  
  virtual uvma_interrupt_if vif;
  
  `uvm_object_utils(uvma_interrupt_cntxt)

  function new(string name="uvma_interrupt_cntxt");
    super.new(name);
  endfunction

endclass : uvma_interrupt_cntxt

`endif // __UVMA_INTERRUPT_CNTXT_SV__
