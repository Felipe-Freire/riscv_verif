`ifndef __IBEX_CORE_PREDICTOR_SV__
`define __IBEX_CORE_PREDICTOR_SV__

class ibex_core_predictor extends uvm_subscriber #(uvma_rvfi_seq_item);
  `uvm_component_utils(ibex_core_predictor)

  // Output port to the Comparator
  uvm_analysis_port #(ibex_core_cosim_verdict) ap;

  chandle spike_handle;

  function new(string name="ibex_core_predictor", uvm_component parent=null);
    super.new(name, parent);
    ap = new("ap", this);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(chandle)::get(this, "", "spike_handle", spike_handle)) begin
      `uvm_fatal("PREDICTOR", "Spike pointer (spike_handle) not found!")
    end
  endfunction

  virtual function void write(uvma_rvfi_seq_item t);
    ibex_core_cosim_verdict verdict;
    int step_result, num_errors;

    // Ignore pipeline bubbles
    if (!t.trap && t.rs1_addr == 0 && t.rs2_addr == 0 && t.rd_addr == 0 && t.pc_rdata == 0) return;

    verdict = ibex_core_cosim_verdict::type_id::create("verdict");
    verdict.rtl_item = t;

    // Query the C++ oracle
    step_result = riscv_cosim_step(spike_handle, t.rd_addr, t.rd_wdata, t.pc_rdata, t.trap);
    verdict.passed = (step_result == 1);

    // On mismatch, collect detailed error evidence
    if (!verdict.passed) begin
      num_errors = riscv_cosim_get_num_errors(spike_handle);
      for (int i = 0; i < num_errors; i++) begin
        verdict.errors.push_back(riscv_cosim_get_error(spike_handle, i));
      end
      riscv_cosim_clear_errors(spike_handle);
    end

    // Send verdict to the Comparator
    ap.write(verdict);
  endfunction

endclass : ibex_core_predictor

`endif // __IBEX_CORE_PREDICTOR_SV__
