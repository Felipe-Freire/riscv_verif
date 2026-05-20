`ifndef __IBEX_CORE_MEM_ERROR_TEST_SV__
`define __IBEX_CORE_MEM_ERROR_TEST_SV__

class ibex_core_mem_error_test extends ibex_core_base_test;
  `uvm_component_utils(ibex_core_mem_error_test)

  function new(string name="ibex_core_mem_error_test", uvm_component parent=null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    // Inject error probability on memory responses
    // Done before super.build_phase so that the environment and agents
    // pick up the updated configuration during their own build_phase.
    if (cfg.data_mem_cfg != null) begin
      cfg.data_mem_cfg.error_prob = 5;
    end
    // if (cfg.instr_mem_cfg != null) begin           Need to enable this in the future when instruction memory error injection is supported
    //   cfg.instr_mem_cfg.error_prob = 2;
    // end

    `uvm_info("MEM_ERR_TEST", $sformatf("Error injection enabled: DMEM=%0d%%, IMEM=%0d%%",
        cfg.data_mem_cfg.error_prob, cfg.instr_mem_cfg.error_prob), UVM_LOW)
  endfunction
endclass : ibex_core_mem_error_test

`endif // __IBEX_CORE_MEM_ERROR_TEST_SV__
