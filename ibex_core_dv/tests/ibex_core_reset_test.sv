`ifndef __IBEX_CORE_RESET_TEST_SV__
`define __IBEX_CORE_RESET_TEST_SV__

class ibex_core_reset_test extends ibex_core_base_test;
  `uvm_component_utils(ibex_core_reset_test)

  function new(string name="ibex_core_reset_test", uvm_component parent=null);
    super.new(name, parent);
  endfunction

  // A arquitetura UVM diz para inicializarmos a sequência principal na run_phase do teste,
  // ou através de um wrapper como execute_vseq() que você já definiu na classe base.
  virtual task execute_vseq();
    ibex_core_reset_vseq reset_vseq;

    `uvm_info("RESET_TEST", "Starting Mid-Flight Reset Test sequence...", UVM_LOW)
    reset_vseq = ibex_core_reset_vseq::type_id::create("reset_vseq");

    reset_vseq.start(env.vsqr);
  endtask

endclass : ibex_core_reset_test

`endif // __IBEX_CORE_RESET_TEST_SV__
