`ifndef __UVMA_SIMPLE_MEM_CNTXT_SV__
`define __UVMA_SIMPLE_MEM_CNTXT_SV__

class uvma_simple_mem_cntxt extends uvm_object;
   
  // Physical and Shared Resources
  virtual uvma_simple_mem_if vif;
  
  // Handle to memory storage model
  uvml_mem mem_model; 

  `uvm_object_utils_begin(uvma_simple_mem_cntxt)
    `uvm_field_object(mem_model, UVM_DEFAULT) 
  `uvm_object_utils_end

  function new(string name="uvma_simple_mem_cntxt");
    super.new(name);
  endfunction
  
  // Connect method to bind interface and memory model
  function void connect(virtual uvma_simple_mem_if vif_h, uvml_mem mem_h);
    this.vif = vif_h;
    this.mem_model = mem_h;
  endfunction : connect

endclass : uvma_simple_mem_cntxt

`endif // __UVMA_SIMPLE_MEM_CNTXT_SV__
