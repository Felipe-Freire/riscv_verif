`ifndef __UVMA_CLK_RST_SQR_SV__
`define __UVMA_CLK_RST_SQR_SV__  

class uvma_clk_rst_sqr extends uvm_sequencer#(uvma_clk_rst_seq_item);
   
  // Handles for configuration and context objects
  uvma_clk_rst_cfg    cfg;
  uvma_clk_rst_cntxt  cntxt;
  
  `uvm_component_utils_begin(uvma_clk_rst_sqr)
    `uvm_field_object(cfg  , UVM_DEFAULT)
    `uvm_field_object(cntxt, UVM_DEFAULT)
  `uvm_component_utils_end
  
  function new(string name="uvma_clk_rst_sqr", uvm_component parent=null);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    // Retrieve handles from Config DB (to ensure the sequencer has access)
    if(!uvm_config_db#(uvma_clk_rst_cfg)::get(this, "", "cfg", cfg))
        `uvm_fatal("CFG", "Sequencer could not get cfg handle")
        
    if(!uvm_config_db#(uvma_clk_rst_cntxt)::get(this, "", "cntxt", cntxt))
        `uvm_fatal("CNTXT", "Sequencer could not get cntxt handle")
  endfunction
   
endclass : uvma_clk_rst_sqr

`endif // __UVMA_CLK_RST_SQR_SV__
