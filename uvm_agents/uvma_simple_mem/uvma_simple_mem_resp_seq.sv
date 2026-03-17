`ifndef __UVMA_SIMPLE_MEM_RESP_SEQ_SV__
`define __UVMA_SIMPLE_MEM_RESP_SEQ_SV__

class uvma_simple_mem_resp_seq extends uvm_sequence#(uvma_simple_mem_seq_item);
    
  `uvm_object_utils(uvma_simple_mem_resp_seq)
  `uvm_declare_p_sequencer(uvma_simple_mem_sqr)

  function new(string name="uvma_simple_mem_resp_seq");
    super.new(name);
  endfunction : new

  task body();
    uvma_simple_mem_seq_item req_item; // Request coming from the Monitor
    uvma_simple_mem_seq_item rsp_item; // Response to the Driver

    forever begin
      // Wait for a request to appear in the Sequencer's FIFO
      p_sequencer.mem_req_fifo.get(req_item);

      `uvm_info("SEQ_RADAR", $sformatf("Processing Response for Address: 0x%0h", req_item.addr), UVM_HIGH)

      // Create the response item
      rsp_item = uvma_simple_mem_seq_item::type_id::create("rsp_item");
      
      // Copy request ID to facilitate waveform debugging
      rsp_item.set_id_info(req_item); 

      // Latency Randomization
      rsp_item.latency = $urandom_range(p_sequencer.cfg.min_latency, 
                                        p_sequencer.cfg.max_latency);

      // Access the Memory (STORAGE)
      if (p_sequencer.cntxt.mem_model == null) begin
        `uvm_fatal("MEM", "Memory Model handle is null in Context!")
      end

      if (req_item.access_type == UVMA_SIMPLE_MEM_WRITE) begin
        for (int i = 0; i < 4; i++) begin
          if (req_item.be[i] == 1'b1) begin
            p_sequencer.cntxt.mem_model.write_byte(req_item.addr + i, req_item.data[(i*8) +: 8]);
          end
        end
        rsp_item.data = '0; 
      end else begin
        rsp_item.data = p_sequencer.cntxt.mem_model.read_word(req_item.addr);
      end

      // Send to the Driver to drive the pins (RVALID/RDATA)
      start_item(rsp_item);
      finish_item(rsp_item);
    end
  endtask : body

endclass : uvma_simple_mem_resp_seq

`endif // __UVMA_SIMPLE_MEM_RESP_SEQ_SV__
