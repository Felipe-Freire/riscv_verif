`ifndef __UVMA_INTERRUPT_MON_TRN_SV__
`define __UVMA_INTERRUPT_MON_TRN_SV__

class uvma_interrupt_mon_trn extends uvm_sequence_item;

  // O estado dos pinos amostrados pelo monitor
  logic [31:0] irq_vector;
  // A máscara dos pinos que sofreram transição (subida ou descida)
  logic [31:0] irq_mask;

  `uvm_object_utils_begin(uvma_interrupt_mon_trn)
    `uvm_field_int(irq_vector, UVM_DEFAULT)
    `uvm_field_int(irq_mask, UVM_DEFAULT)
  `uvm_object_utils_end

  function new(string name="uvma_interrupt_mon_trn");
    super.new(name);
  endfunction

endclass : uvma_interrupt_mon_trn

`endif // __UVMA_INTERRUPT_MON_TRN_SV__
