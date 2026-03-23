`ifndef __IBEX_CORE_COMPARATOR_SV__
`define __IBEX_CORE_COMPARATOR_SV__

class ibex_core_comparator extends uvm_subscriber #(ibex_core_cosim_verdict);
  `uvm_component_utils(ibex_core_comparator)

  int unsigned match_count = 0;
  int unsigned mismatch_count = 0;

  function new(string name="ibex_core_comparator", uvm_component parent=null);
    super.new(name, parent);
  endfunction

  virtual function void write(ibex_core_cosim_verdict t);
    if (t.passed) begin
      match_count++;
      `uvm_info("COMPARATOR", $sformatf("[PASS] PC: 0x%0x | RD: x%0d | WDATA: 0x%0x", 
                t.rtl_item.pc_rdata, t.rtl_item.rd_addr, t.rtl_item.rd_wdata), UVM_LOW)
    end else begin
      mismatch_count++;
      `uvm_error("COMPARATOR_FAIL", $sformatf("Critical divergence at PC 0x%0x!", t.rtl_item.pc_rdata))
      
      // Print all technical details collected by the Predictor
      foreach(t.errors[i]) begin
        `uvm_error("COMPARATOR_FAIL", $sformatf("-> Spike detail: %s", t.errors[i]))
      end
    end
  endfunction

  // Print the scoreboard summary at end of simulation
  function void report_phase(uvm_phase phase);
    super.report_phase(phase);
    `uvm_info("SCOREBOARD_REPORT", $sformatf("Total Matches: %0d | Total Mismatches: %0d", match_count, mismatch_count), UVM_LOW)
  endfunction

endclass : ibex_core_comparator

`endif // __IBEX_CORE_COMPARATOR_SV__
