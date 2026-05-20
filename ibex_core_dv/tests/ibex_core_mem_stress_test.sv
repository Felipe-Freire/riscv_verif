`ifndef __IBEX_CORE_MEM_STRESS_TEST_SV__
`define __IBEX_CORE_MEM_STRESS_TEST_SV__

/**
 * Class: ibex_core_mem_stress_test
 *
 * Injects extreme bus-protocol stress on the D-Side memory interface to close
 * condition/expression coverage gaps in ibex_top.sv's pending_dside_accesses
 * tracker logic. Specifically targets:
 *   - data_req_o && data_gnt_i && !pending_dside_accesses_shifted[0].valid
 *   - data_req_o && data_gnt_i && pending_dside_accesses_shifted[0].valid
 *     && !pending_dside_accesses_shifted[1].valid
 *
 * Strategy: Randomized grant delays (0-10 cycles) mixed with high response
 * latency (0-15 cycles) force the LSU pipeline to back up, creating multiple
 * outstanding D-side accesses.
 */
class ibex_core_mem_stress_test extends ibex_core_base_test;
  `uvm_component_utils(ibex_core_mem_stress_test)

  function new(string name="ibex_core_mem_stress_test", uvm_component parent=null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    // Override D-Side memory agent config for maximum bus chaos
    if (cfg.data_mem_cfg != null) begin
      cfg.data_mem_cfg.min_gnt_delay = 0;   // Mix instant grants with delayed ones
      cfg.data_mem_cfg.max_gnt_delay = 10;  // Up to 10 cycles before granting
      cfg.data_mem_cfg.min_latency   = 0;   // Mix zero-latency responses with slow ones
      cfg.data_mem_cfg.max_latency   = 15;  // Up to 15-cycle response latency
      cfg.data_mem_cfg.error_prob    = 3;   // 3% bus error injection
    end

    // Instruction memory stays well-behaved to avoid starving the pipeline
    // (instruction fetch stalls would reduce D-side traffic, defeating the purpose)

    `uvm_info("MEM_STRESS_TEST", $sformatf(
        "D-Side stress config: gnt_delay=[%0d:%0d], latency=[%0d:%0d], error=%0d%%",
        cfg.data_mem_cfg.min_gnt_delay, cfg.data_mem_cfg.max_gnt_delay,
        cfg.data_mem_cfg.min_latency, cfg.data_mem_cfg.max_latency,
        cfg.data_mem_cfg.error_prob), UVM_LOW)
  endfunction

endclass : ibex_core_mem_stress_test

`endif // __IBEX_CORE_MEM_STRESS_TEST_SV__
