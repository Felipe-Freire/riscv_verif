`ifndef __UVMA_CLK_RST_SEQ_ITEM_SV__
`define __UVMA_CLK_RST_SEQ_ITEM_SV__

class uvma_clk_rst_seq_item extends uvm_sequence_item;

  rand uvma_clk_rst_seq_item_action_enum action;
  rand realtime new_period;
  rand realtime reset_duration;
  
  `uvm_object_utils_begin(uvma_clk_rst_seq_item)
    `uvm_field_enum(uvma_clk_rst_seq_item_action_enum, action, UVM_DEFAULT)
    `uvm_field_real(new_period, UVM_DEFAULT)
    `uvm_field_real(reset_duration, UVM_DEFAULT)
  `uvm_object_utils_end
  
  constraint default_cons {
    soft new_period     == 10.0;
    soft reset_duration == 100.0;
  }
  
  function new(string name="uvma_clk_rst_seq_item");
    super.new(name);
  endfunction

endclass : uvma_clk_rst_seq_item

`endif // __UVMA_CLK_RST_SEQ_ITEM_SV__
