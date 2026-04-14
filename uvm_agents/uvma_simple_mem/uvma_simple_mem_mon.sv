`ifndef __UVMA_SIMPLE_MEM_MON_SV__
`define __UVMA_SIMPLE_MEM_MON_SV__

class uvma_simple_mem_mon extends uvm_monitor;

  uvma_simple_mem_cfg    cfg;
  uvma_simple_mem_cntxt  cntxt;

  // Port to publish requests
  uvm_analysis_port#(uvma_simple_mem_seq_item) req_ap;

  `uvm_component_utils(uvma_simple_mem_mon)

  function new(string name="uvma_simple_mem_mon", uvm_component parent=null);
    super.new(name, parent);
    req_ap = new("req_ap", this);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    void'(uvm_config_db#(uvma_simple_mem_cfg)::get(this, "", "cfg", cfg));
    void'(uvm_config_db#(uvma_simple_mem_cntxt)::get(this, "", "cntxt", cntxt));
  endfunction

  task run_phase(uvm_phase phase);
    if (!cfg.enabled) return;
    
    forever begin
      @(cntxt.vif.mon_cb);
      
      // If there is an address handshake (Req + Gnt)
      if (cntxt.vif.mon_cb.req && cntxt.vif.mon_cb.gnt) begin
        uvma_simple_mem_seq_item item = uvma_simple_mem_seq_item::type_id::create("item");
        
        item.addr        = cntxt.vif.mon_cb.addr;
        item.access_type = cntxt.vif.mon_cb.we ? UVMA_SIMPLE_MEM_WRITE : UVMA_SIMPLE_MEM_READ;
        item.data        = cntxt.vif.mon_cb.wdata; // Only valid if Write
        item.be          = cntxt.vif.mon_cb.be;
        
        `uvm_info("MON_RADAR", $sformatf("Order captured at the address: 0x%0h", item.addr), UVM_HIGH)

        // Publish the request
        req_ap.write(item);
      end
    end
  endtask

endclass : uvma_simple_mem_mon

`endif // __UVMA_SIMPLE_MEM_MON_SV__
