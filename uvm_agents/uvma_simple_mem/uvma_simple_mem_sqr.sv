`ifndef __UVMA_SIMPLE_MEM_SQR_SV__
`define __UVMA_SIMPLE_MEM_SQR_SV__

class uvma_simple_mem_sqr extends uvm_sequencer#(uvma_simple_mem_seq_item);
   
  uvma_simple_mem_cfg    cfg;
  uvma_simple_mem_cntxt  cntxt;
  
  uvm_analysis_export #(uvma_simple_mem_seq_item) item_export;

  // FIFO to receive requests from the Monitor (Reactive)
  uvm_tlm_analysis_fifo#(uvma_simple_mem_seq_item) mem_req_fifo;

  `uvm_component_utils_begin(uvma_simple_mem_sqr)
    `uvm_field_object(cfg,   UVM_DEFAULT)
    `uvm_field_object(cntxt, UVM_DEFAULT)
  `uvm_component_utils_end

  function new(string name="uvma_simple_mem_sqr", uvm_component parent=null);
    super.new(name, parent);
    mem_req_fifo = new("mem_req_fifo", this);
    item_export  = new("item_export", this);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    // Retrieve Configuration
    if(!uvm_config_db#(uvma_simple_mem_cfg)::get(this, "", "cfg", cfg)) begin
      `uvm_fatal("CFG", "Sequencer config handle is null")
    end
    
    // Retrieve Context (ADDED)
    if(!uvm_config_db#(uvma_simple_mem_cntxt)::get(this, "", "cntxt", cntxt)) begin
      `uvm_fatal("CNTXT", "Sequencer context handle is null")
    end
  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    item_export.connect(mem_req_fifo.analysis_export);
  endfunction

endclass : uvma_simple_mem_sqr

`endif // __UVMA_SIMPLE_MEM_SQR_SV__
