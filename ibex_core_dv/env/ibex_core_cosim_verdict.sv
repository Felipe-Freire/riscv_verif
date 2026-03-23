`ifndef __IBEX_CORE_COSIM_VERDICT_SV__
`define __IBEX_CORE_COSIM_VERDICT_SV__

// This is the "envelope" that travels from Predictor to Comparator
class ibex_core_cosim_verdict extends uvm_sequence_item;
  
  uvma_rvfi_seq_item rtl_item;   // Original transaction from Ibex
  bit                passed;     // 1 = Matched Spike, 0 = Error
  string             errors[$];  // List of error messages (if any)

  `uvm_object_utils_begin(ibex_core_cosim_verdict)
    `uvm_field_object(rtl_item, UVM_DEFAULT)
    `uvm_field_int(passed, UVM_DEFAULT)
  `uvm_object_utils_end

  function new(string name="ibex_core_cosim_verdict");
    super.new(name);
  endfunction

endclass : ibex_core_cosim_verdict

`endif // __IBEX_CORE_COSIM_VERDICT_SV__
