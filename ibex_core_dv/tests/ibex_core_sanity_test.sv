`ifndef __IBEX_CORE_SANITY_TEST_SV__
`define __IBEX_CORE_SANITY_TEST_SV__

class ibex_core_sanity_test extends ibex_core_base_test;
  `uvm_component_utils(ibex_core_sanity_test)

  function new(string name="ibex_core_sanity_test", uvm_component parent=null);
    super.new(name, parent);
  endfunction

  task run_phase(uvm_phase phase);
    uvma_clk_rst_sanity_seq sanity_seq;

    sanity_seq = uvma_clk_rst_sanity_seq::type_id::create("sanity_seq");

    phase.raise_objection(this);
    
    `uvm_info("SANITY_TEST", "Starting Sanity Sequence (Only for Clock and Reset Agent)...", UVM_LOW)
    
    // Triggers the sequence in the clock agent sequencer
    sanity_seq.start(env.clk_rst_agent.sequencer);
    
    // Lets the simulation run for another 500ns to see the clock waves
    #5000ns;
    
    `uvm_info("SANITY_TEST", "Sanity Test completed successfully.", UVM_LOW)
    
    phase.drop_objection(this);
  endtask
endclass : ibex_core_sanity_test

`endif // __IBEX_CORE_SANITY_TEST_SV__