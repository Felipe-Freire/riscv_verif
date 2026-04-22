`ifndef __IBEX_CORE_COMPARATOR_SV__
`define __IBEX_CORE_COMPARATOR_SV__

class ibex_core_comparator extends uvm_subscriber #(ibex_core_cosim_verdict);

  int unsigned match_count = 0;
  int unsigned mismatch_count = 0;

  ibex_core_cfg cfg;

  `uvm_component_utils(ibex_core_comparator)

  function new(string name="ibex_core_comparator", uvm_component parent=null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(ibex_core_cfg)::get(this, "", "cfg", cfg)) begin
      `uvm_fatal("COMPARATOR", "Failed to get configuration for comparator");
    end
  endfunction

  virtual function void write(ibex_core_cosim_verdict t);
    if (t.passed) begin
      match_count++;
      `uvm_info("COMPARATOR", $sformatf("[PASS] PC: 0x%0x | RD: x%0d | WDATA: 0x%0x", 
                t.rtl_item.pc_rdata, t.rtl_item.rd_addr, t.rtl_item.rd_wdata), UVM_LOW)
    end else begin
      mismatch_count++;
      
      // Print all technical details collected by the Predictor
      foreach(t.errors[i]) begin
        // Em testes de interrupção (relax_cosim_check), toleramos assincronia e pulos do Spike
        if (cfg.relax_cosim_check) begin
           `uvm_info("COMPARATOR_RELAX", $sformatf("Divergence Relaxed: %s (RTL PC: 0x%0x)", t.errors[i], t.rtl_item.pc_rdata), UVM_LOW)
        end else begin
           `uvm_error("COMPARATOR_FAIL", $sformatf("Critical divergence at PC 0x%0x: %s", t.rtl_item.pc_rdata, t.errors[i]))
        end
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
