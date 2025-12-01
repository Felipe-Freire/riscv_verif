`ifndef __UVMA_CLK_RST_CNTXT_SV__
`define __UVMA_CLK_RST_CNTXT_SV__

class uvma_clk_rst_cntxt extends uvm_object;

  virtual uvma_clk_rst_if vif;
   
  `uvm_object_utils(uvma_clk_rst_cntxt)
  
  function new(string name="uvma_clk_rst_cntxt");
    super.new(name);
  endfunction
endclass

`endif // __UVMA_CLK_RST_CNTXT_SV__
