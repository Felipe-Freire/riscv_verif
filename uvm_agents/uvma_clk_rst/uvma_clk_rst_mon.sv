`ifndef __UVMA_CLK_RST_MON_SV__
`define __UVMA_CLK_RST_MON_SV__

class uvma_clk_rst_mon extends uvm_component;
  uvma_clk_rst_cfg    cfg;
  uvma_clk_rst_cntxt  cntxt;
  
  uvm_analysis_imp#(uvma_clk_rst_seq_item, uvma_clk_rst_mon) imp;
  uvm_analysis_port#(uvma_clk_rst_seq_item) ap;
  
  `uvm_component_utils(uvma_clk_rst_mon)
  
  function new(string name="uvma_clk_rst_mon", uvm_component parent=null);
    super.new(name, parent);
    ap = new("ap", this);
    imp = new("imp", this);
    ap.connect(imp);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    if(!uvm_config_db#(uvma_clk_rst_cfg)::get(this, "", "cfg", cfg))
      `uvm_fatal("CFG", "Monitor config handle is null")
        
    if(!uvm_config_db#(uvma_clk_rst_cntxt)::get(this, "", "cntxt", cntxt))
      `uvm_fatal("CNTXT", "Monitor context handle is null")
  endfunction
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    
    // If not enabled, exit
    if (!cfg.enabled) return;
    
    // Parallel monitoring of Clock and Reset
    fork
      monitor_reset();
      monitor_clk_activity();
    join_none
  endtask
  
  // Task to observe changes in Reset
  task monitor_reset();
    forever begin
      // Wait for any change in the reset signal
      @(cntxt.vif.reset_n);
      
      if (cntxt.vif.reset_n == 0) begin
      `uvm_info("MON", "Reset ASSERTED (Active)", UVM_MEDIUM)
      // Here you could create a seq_item and write to the port ap.write(item)
      end else begin
      `uvm_info("MON", "Reset DE-ASSERTED (Inactive)", UVM_MEDIUM)
      end
    end
  endtask
  
  // Simple task to check if the clock is alive (Heartbeat)
  task monitor_clk_activity();
    forever begin
      @(posedge cntxt.vif.clk);
      // Only for high verbosity debug, to avoid polluting the log
      `uvm_info("MON", "Clock edge detected", UVM_DEBUG)
    end
  endtask

endclass : uvma_clk_rst_mon

`endif // __UVMA_CLK_RST_MON_SV__
