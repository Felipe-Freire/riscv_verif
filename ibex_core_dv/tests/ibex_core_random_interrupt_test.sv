`ifndef __IBEX_CORE_RANDOM_INTERRUPT_TEST_SV__
`define __IBEX_CORE_RANDOM_INTERRUPT_TEST_SV__

class ibex_core_random_interrupt_test extends ibex_core_base_test;
  `uvm_component_utils(ibex_core_random_interrupt_test)

  function new(string name="ibex_core_random_interrupt_test", uvm_component parent=null);
    super.new(name, parent);
  endfunction

  virtual task execute_vseq();
    ibex_random_interrupt_vseq rand_int_vseq;

    `uvm_info("RANDOM_IRQ_TEST", "Starting Random IRQ Test sequence...", UVM_LOW)
    rand_int_vseq = ibex_random_interrupt_vseq::type_id::create("rand_int_vseq");

    rand_int_vseq.start(env.vsqr);
  endtask

endclass : ibex_core_random_interrupt_test

`endif // __IBEX_CORE_RANDOM_INTERRUPT_TEST_SV__
