`ifndef __UVMA_INTERRUPT_BASE_SEQ_SV__
`define __UVMA_INTERRUPT_BASE_SEQ_SV__

class uvma_interrupt_base_seq extends uvm_sequence#(uvma_interrupt_seq_item);
   
  `uvm_object_utils(uvma_interrupt_base_seq)
  
  // Declara o p_sequencer para termos acesso ao cfg e cntxt
  `uvm_declare_p_sequencer(uvma_interrupt_sqr)
  
  // Construtor
  function new(string name="uvma_interrupt_base_seq");
    super.new(name);
  endfunction
   
endclass : uvma_interrupt_base_seq

`endif // __UVMA_INTERRUPT_BASE_SEQ_SV__
