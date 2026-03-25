`ifndef __UVMA_ISACOV_MON_TRN_SV__
`define __UVMA_ISACOV_MON_TRN_SV__

class uvma_isacov_mon_trn extends uvm_sequence_item;
  
  // A instrução totalmente decodificada
  uvma_isacov_instr instr;

  `uvm_object_utils_begin(uvma_isacov_mon_trn)
    `uvm_field_object(instr, UVM_DEFAULT)
  `uvm_object_utils_end

  function new(string name="uvma_isacov_mon_trn");
    super.new(name);
  endfunction

endclass : uvma_isacov_mon_trn

`endif // __UVMA_ISACOV_MON_TRN_SV__
