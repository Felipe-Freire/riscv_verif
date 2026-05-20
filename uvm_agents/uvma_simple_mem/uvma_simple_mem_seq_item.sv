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

  // Co-simulation fields (populated by monitor at response phase).
  // Required by riscv_cosim_notify_dside_access() for correct lockstep checking.
  rand bit error;         // Bus error response from DUT (captured at rvalid)
  rand bit m_mode_access; // Access occurred in M-mode privilege

  `uvm_object_utils_begin(uvma_simple_mem_seq_item)
    `uvm_field_int (addr, UVM_DEFAULT + UVM_HEX)
    `uvm_field_enum(uvma_simple_mem_access_e, access_type, UVM_DEFAULT)
    `uvm_field_int (data, UVM_DEFAULT + UVM_HEX)
    `uvm_field_int (latency, UVM_DEFAULT)
    `uvm_field_int (error, UVM_DEFAULT)
  `uvm_object_utils_end

  function new(string name="uvma_simple_mem_seq_item");
    super.new(name);
  endfunction

endclass : uvma_simple_mem_seq_item

`endif // __UVMA_SIMPLE_MEM_SEQ_ITEM_SV__
