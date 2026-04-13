`ifndef __UVMA_RVFI_CNTXT_SV__
`define __UVMA_RVFI_CNTXT_SV__

class uvma_rvfi_cntxt extends uvm_object;
  `uvm_object_utils(uvma_rvfi_cntxt)

  // Pointer to hardware wires
  virtual uvma_rvfi_instr_if vif;

  function new(string name="uvma_rvfi_cntxt");
    super.new(name);
  endfunction

endclass : uvma_rvfi_cntxt

`endif // __UVMA_RVFI_CNTXT_SV__
