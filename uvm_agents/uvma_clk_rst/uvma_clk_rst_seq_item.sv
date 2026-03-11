`ifndef __UVMA_CLK_RST_SEQ_ITEM_SV__
`define __UVMA_CLK_RST_SEQ_ITEM_SV__

class uvma_clk_rst_seq_item extends uvm_sequence_item;

  rand uvma_clk_rst_seq_item_action_enum action;
  rand int unsigned new_period_ps;
  rand int unsigned reset_duration_ps;
  
  `uvm_object_utils_begin(uvma_clk_rst_seq_item)
    `uvm_field_enum(uvma_clk_rst_seq_item_action_enum, action, UVM_DEFAULT)
    `uvm_field_int(new_period_ps, UVM_DEFAULT)
    `uvm_field_int(reset_duration_ps, UVM_DEFAULT)
  `uvm_object_utils_end
  
  constraint default_cons {
    soft new_period_ps     == 10000; // 10 ns = 100MHz
    soft reset_duration_ps == 50000; // 50 ns
  }
  
  function new(string name="uvma_clk_rst_seq_item");
    super.new(name);
  endfunction

endclass : uvma_clk_rst_seq_item

`endif // __UVMA_CLK_RST_SEQ_ITEM_SV__
