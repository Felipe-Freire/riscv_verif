`ifndef __UVMA_SIMPLE_MEM_DRV_SV__
`define __UVMA_SIMPLE_MEM_DRV_SV__

class uvma_simple_mem_drv extends uvm_driver#(uvma_simple_mem_seq_item);
   
  uvma_simple_mem_cntxt cntxt;

  `uvm_component_utils(uvma_simple_mem_drv)

  function new(string name="uvma_simple_mem_drv", uvm_component parent=null);
    super.new(name, parent);
  endfunction : new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    if(!uvm_config_db#(uvma_simple_mem_cntxt)::get(this, "", "cntxt", cntxt))
      `uvm_fatal("CNTXT", "Driver context not found")

  endfunction : build_phase

  task run_phase(uvm_phase phase);
    // Init signals
    cntxt.vif.slave_cb.gnt        <= 0;
    cntxt.vif.slave_cb.rvalid     <= 0;
    cntxt.vif.slave_cb.rdata      <= 0;
    cntxt.vif.slave_cb.err        <= 0;
    cntxt.vif.slave_cb.rdata_intg <= 0;

    // Wait for reset to deassert
    wait(cntxt.vif.rst_n === 1);

    fork
      do_grant_phase();    // Thread 1: Accepting Orders
      do_response_phase(); // Thread 2: Returning Data (Controlled by the Sequence)
    join
  endtask : run_phase

  // Thread 1: Address Phase (Always accepts requests immediately for now)
  task do_grant_phase();
    forever begin
      @(cntxt.vif.slave_cb);
      if (cntxt.vif.slave_cb.req) begin
        cntxt.vif.slave_cb.gnt <= 1;
      end else begin
        cntxt.vif.slave_cb.gnt <= 0;
      end
    end
  endtask : do_grant_phase

  // Thread 2: Data Phase (Receives from the Sequence)
  task do_response_phase();
    forever begin
      // 1. Requests the ready response item from the Sequence
      seq_item_port.get_next_item(req); // Here 'req' is actually the processed RESPONSE

      // 2. Simulates latency
      if (req.latency > 0) begin
        repeat(req.latency) @(cntxt.vif.slave_cb);
      end

      // 3. Drives the bus
      cntxt.vif.slave_cb.rvalid <= 1;
      cntxt.vif.slave_cb.rdata  <= req.data; // Data read from memory (if Read)
      cntxt.vif.slave_cb.rdata_intg <= 0;

      // 4. 1-cycle Handshake
      @(cntxt.vif.slave_cb);
      cntxt.vif.slave_cb.rvalid <= 0;
      
      seq_item_port.item_done();
    end
  endtask : do_response_phase

endclass : uvma_simple_mem_drv

`endif // __UVMA_SIMPLE_MEM_DRV_SV__
