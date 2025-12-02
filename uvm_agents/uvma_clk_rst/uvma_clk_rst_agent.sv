`ifndef __UVMA_CLK_RST_AGENT_SV__
`define __UVMA_CLK_RST_AGENT_SV__

class uvma_clk_rst_agent extends uvm_agent;

  uvma_clk_rst_cfg    cfg;
  uvma_clk_rst_cntxt  cntxt;
  uvma_clk_rst_drv    driver;
  uvma_clk_rst_mon    monitor;

  uvm_sequencer#(uvma_clk_rst_seq_item) sequencer;
  
  `uvm_component_utils(uvma_clk_rst_agent)
  
  function new(string name="uvma_clk_rst_agent", uvm_component parent=null);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    // Take Config
    if(!uvm_config_db#(uvma_clk_rst_cfg)::get(this, "", "cfg", cfg))
      `uvm_fatal("CFG", "Agent needs cfg")
    
    // Manage Context (Create if it doesn't exist)
    if(!uvm_config_db#(uvma_clk_rst_cntxt)::get(this, "", "cntxt", cntxt)) begin
      cntxt = uvma_clk_rst_cntxt::type_id::create("cntxt");
      uvm_config_db#(uvma_clk_rst_cntxt)::set(this, "*", "cntxt", cntxt);
    end
    
    // Get Virtual Interface and put it in Context
    if(!uvm_config_db#(virtual uvma_clk_rst_if)::get(this, "", "vif", cntxt.vif))
      `uvm_fatal("VIF", "Agent needs interface")
        
    // Create Components
    monitor = uvma_clk_rst_mon::type_id::create("monitor", this);
    
    if (cfg.is_active == UVM_ACTIVE) begin
      driver = uvma_clk_rst_drv::type_id::create("driver", this);
      sequencer = uvm_sequencer#(uvma_clk_rst_seq_item)::type_id::create("sequencer", this);
    end
  endfunction
  
  function void connect_phase(uvm_phase phase);
    if (cfg.is_active == UVM_ACTIVE) begin
      driver.seq_item_port.connect(sequencer.seq_item_export);
    end
  endfunction

endclass : uvma_clk_rst_agent

`endif // __UVMA_CLK_RST_AGENT_SV__
