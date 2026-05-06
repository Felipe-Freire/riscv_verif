`ifndef __UVMA_SIMPLE_MEM_MON_SV__
`define __UVMA_SIMPLE_MEM_MON_SV__

// TODO: It must be able to handle misaligned readings for the tests to work.

class uvma_simple_mem_mon extends uvm_monitor;

  uvma_simple_mem_cfg    cfg;
  uvma_simple_mem_cntxt  cntxt;

  // Port to publish requests
  uvm_analysis_port #(uvma_simple_mem_seq_item) req_ap; // For Sequencer (Immediate)
  uvm_analysis_port #(uvma_simple_mem_seq_item) rsp_ap; // For Scoreboard (Delayed)

  // Pipeline queue
  mailbox #(uvma_simple_mem_seq_item) pending_tx;

  `uvm_component_utils(uvma_simple_mem_mon)

  function new(string name="uvma_simple_mem_mon", uvm_component parent=null);
    super.new(name, parent);
    req_ap = new("req_ap", this);
    rsp_ap = new("rsp_ap", this);
    pending_tx = new();
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  
    if (!uvm_config_db#(uvma_simple_mem_cfg)::get(this, "", "cfg", cfg))
      `uvm_fatal("CFG", "Monitor config not found")

    if (!uvm_config_db#(uvma_simple_mem_cntxt)::get(this, "", "cntxt", cntxt))
      `uvm_fatal("CNTXT", "Monitor context not found")
  endfunction

  task run_phase(uvm_phase phase);
    if (!cfg.enabled) return;
    fork
      collect_req();
      collect_rsp();
    join
  endtask

  task collect_req();
    forever begin
      @(cntxt.vif.mon_cb);
      if (cntxt.vif.mon_cb.req && cntxt.vif.mon_cb.gnt) begin
        uvma_simple_mem_seq_item item = uvma_simple_mem_seq_item::type_id::create("item");
        
        item.addr        = cntxt.vif.mon_cb.addr;
        item.access_type = cntxt.vif.mon_cb.we ? UVMA_SIMPLE_MEM_WRITE : UVMA_SIMPLE_MEM_READ;
        item.be          = cntxt.vif.mon_cb.be;
        
        if (item.access_type == UVMA_SIMPLE_MEM_WRITE) begin
          item.data      = cntxt.vif.mon_cb.wdata;
        end
        
        req_ap.write(item); 
        
        pending_tx.put(item);
      end
    end
  endtask

  task collect_rsp();
    uvma_simple_mem_seq_item item;
    forever begin
      pending_tx.get(item);
      
      while (cntxt.vif.mon_cb.rvalid !== 1'b1) begin
        @(cntxt.vif.mon_cb);
      end

      if (item.access_type == UVMA_SIMPLE_MEM_READ) begin
        item.data = cntxt.vif.mon_cb.rdata;
      end

      // Capture bus error status at response time.
      // Required by SpikeCosim::check_mem_access() for correct fault propagation.
      item.error = cntxt.vif.mon_cb.err;

      // Default m_mode_access to 1 (M-mode). Without internal RTL probes,
      // we cannot determine the privilege level of the access. This is safe
      // as long as tests run in M-mode only. For U-mode tests, RTL probes
      // must be added to uvma_simple_mem_if.
      item.m_mode_access = 1'b1;

      rsp_ap.write(item);
    end
  endtask

endclass : uvma_simple_mem_mon

`endif // __UVMA_SIMPLE_MEM_MON_SV__
