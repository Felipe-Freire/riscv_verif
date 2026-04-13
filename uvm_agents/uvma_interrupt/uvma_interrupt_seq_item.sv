`ifndef __UVMA_INTERRUPT_SEQ_ITEM_SV__
`define __UVMA_INTERRUPT_SEQ_ITEM_SV__

class uvma_interrupt_seq_item extends uvm_sequence_item;
   
  // Variáveis Randomizáveis
  rand uvma_interrupt_seq_item_action_e action;
  
  // Cada bit em '1' indica que aquele ID de interrupção sofrerá a ação
  rand bit [31:0]   irq_mask; 
  
  // Atraso (em ciclos de clock) antes de aplicar a ação para cada pino
  rand int unsigned skew[32]; 

  // Registro na Factory
  `uvm_object_utils_begin(uvma_interrupt_seq_item)
    `uvm_field_enum      (uvma_interrupt_seq_item_action_e, action, UVM_DEFAULT)
    `uvm_field_int       (irq_mask, UVM_DEFAULT)
    `uvm_field_sarray_int(skew, UVM_DEFAULT)
  `uvm_object_utils_end

  // Constraints base (podem ser sobrescritas nas Sequences)
  constraint default_skew_cons {
    foreach (skew[i]) {
      skew[i] inside {[0:20]}; // Mantém o atraso inicial razoável (0 a 20 ciclos)
    }
  }

  constraint valid_irq_mask_cons {
    irq_mask != 0; // Pelo menos um bit deve estar levantado para a transação fazer sentido
  }

  // Construtor
  function new(string name="uvma_interrupt_seq_item");
    super.new(name);
  endfunction
   
endclass : uvma_interrupt_seq_item

`endif // __UVMA_INTERRUPT_SEQ_ITEM_SV__
