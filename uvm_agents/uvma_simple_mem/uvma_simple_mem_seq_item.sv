`ifndef __UVMA_SIMPLE_MEM_SEQ_ITEM_SV__
`define __UVMA_SIMPLE_MEM_SEQ_ITEM_SV__

class uvma_simple_mem_seq_item extends uvm_sequence_item;
   
  // Transaction data
  rand logic [31:0] addr;
  rand logic [31:0] data;                    // WDATA ou RDATA
  rand logic [3:0 ] be;                      // Byte Enable
  rand uvma_simple_mem_access_e access_type; // READ/WRITE
  
  // Timing Control
  rand int latency;

  `uvm_object_utils_begin(uvma_simple_mem_seq_item)
    `uvm_field_int (addr, UVM_DEFAULT + UVM_HEX)
    `uvm_field_enum(uvma_simple_mem_access_e, access_type, UVM_DEFAULT)
    `uvm_field_int (data, UVM_DEFAULT + UVM_HEX)
    `uvm_field_int (latency, UVM_DEFAULT)
  `uvm_object_utils_end

  function new(string name="uvma_simple_mem_seq_item");
    super.new(name);
  endfunction

endclass : uvma_simple_mem_seq_item

`endif // __UVMA_SIMPLE_MEM_SEQ_ITEM_SV__
