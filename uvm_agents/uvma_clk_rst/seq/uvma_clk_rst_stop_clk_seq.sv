`ifndef __UVMA_CLK_RST_STOP_CLK_SEQ_SV__
`define __UVMA_CLK_RST_STOP_CLK_SEQ_SV__
  
class uvma_clk_rst_stop_clk_seq extends uvma_clk_rst_base_seq;

  `uvm_object_utils(uvma_clk_rst_stop_clk_seq)

  function new(string name="uvma_clk_rst_stop_clk_seq");
    super.new(name);
  endfunction

  task body();
    uvma_clk_rst_seq_item req;
    
    `uvm_info("CLK_RST_SEQ", "Stopping Clock...", UVM_LOW)

    req = uvma_clk_rst_seq_item::type_id::create("req");
    start_item(req);
    req.action = UVMA_CLK_RST_SEQ_ITEM_ACTION_STOP_CLK;
    finish_item(req);

    `uvm_info("CLK_RST_SEQ", "Clock stopped.", UVM_LOW)
    
  endtask

endclass : uvma_clk_rst_stop_clk_seq

`endif // __UVMA_CLK_RST_STOP_CLK_SEQ_SV__
