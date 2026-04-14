`ifndef __UVMA_CLK_RST_BASE_SEQ_SV__
`define __UVMA_CLK_RST_BASE_SEQ_SV__

class uvma_clk_rst_base_seq extends uvm_sequence#(uvma_clk_rst_seq_item);
  
  `uvm_object_utils(uvma_clk_rst_base_seq)
  
  // Declares the p_sequencer to have direct access to the agent's sequencer
  `uvm_declare_p_sequencer(uvma_clk_rst_sqr)

  function new(string name="uvma_clk_rst_base_seq");
    super.new(name);
  endfunction

endclass : uvma_clk_rst_base_seq

`endif // __UVMA_CLK_RST_BASE_SEQ_SV__