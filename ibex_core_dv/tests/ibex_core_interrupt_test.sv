`ifndef __IBEX_CORE_INTERRUPT_TEST_SV__
`define __IBEX_CORE_INTERRUPT_TEST_SV__
  
class ibex_core_interrupt_test extends ibex_core_base_test;
  `uvm_component_utils(ibex_core_interrupt_test)

  function new(string name="ibex_core_interrupt_test", uvm_component parent=null);
    super.new(name, parent);
  endfunction

  virtual task execute_vseq();
    ibex_interrupt_test_vseq int_vseq;
    
    `uvm_info("TEST", "Executando a VSEQ de Interrupcao...", UVM_LOW)
    int_vseq = ibex_interrupt_test_vseq::type_id::create("int_vseq");
    
    // A int_vseq vai cuidar de chamar a boot_vseq internamente e depois disparar o pino!
    int_vseq.start(env.vsqr);
  endtask

endclass : ibex_core_interrupt_test

`endif // __IBEX_CORE_INTERRUPT_TEST_SV__
