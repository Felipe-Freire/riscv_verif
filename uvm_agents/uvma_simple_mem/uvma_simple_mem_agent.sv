`ifndef __UVMA_SIMPLE_MEM_AGENT_SV__
`define __UVMA_SIMPLE_MEM_AGENT_SV__

class uvma_simple_mem_agent extends uvm_agent;
  `uvm_component_utils(uvma_simple_mem_agent)

  uvma_simple_mem_cfg    cfg;
  uvma_simple_mem_cntxt  cntxt;
  
  uvma_simple_mem_drv    driver;
  uvma_simple_mem_mon    monitor;
  uvma_simple_mem_sqr    sequencer;
  
  function new(string name="uvma_simple_mem_agent", uvm_component parent=null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    // Pega Config e Contexto
    if(!uvm_config_db#(uvma_simple_mem_cfg)::get(this, "", "cfg", cfg))
      `uvm_fatal("CFG", "Agent config not found")
    
    if(!uvm_config_db#(uvma_simple_mem_cntxt)::get(this, "", "cntxt", cntxt)) begin
      cntxt = uvma_simple_mem_cntxt::type_id::create("cntxt");
      uvm_config_db#(uvma_simple_mem_cntxt)::set(this, "*", "cntxt", cntxt);
    end
    
    if(!uvm_config_db#(virtual uvma_simple_mem_if)::get(this, "", "vif", cntxt.vif))
      `uvm_fatal("VIF", "Virtual Interface not found")

    monitor = uvma_simple_mem_mon::type_id::create("monitor", this);

    if (cfg.is_active == UVM_ACTIVE) begin
      driver    = uvma_simple_mem_drv::type_id::create("driver", this);
      sequencer = uvma_simple_mem_sqr::type_id::create("sequencer", this);
    end
  endfunction

  function void connect_phase(uvm_phase phase);
    if (cfg.is_active == UVM_ACTIVE) begin
      driver.seq_item_port.connect(sequencer.seq_item_export);
        
      // Reactive Connection: Monitor -> Sequencer FIFO
      //monitor.req_ap.connect(sequencer.req_fifo.analysis_export);
      monitor.req_ap.connect(sequencer.item_export);
    end
  endfunction

endclass : uvma_simple_mem_agent

`endif // __UVMA_SIMPLE_MEM_AGENT_SV__
