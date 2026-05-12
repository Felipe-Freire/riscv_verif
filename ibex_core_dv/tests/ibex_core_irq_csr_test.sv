`ifndef __IBEX_CORE_IRQ_CSR_TEST_SV__
`define __IBEX_CORE_IRQ_CSR_TEST_SV__

class ibex_core_irq_csr_test extends ibex_core_base_test;
  `uvm_component_utils(ibex_core_irq_csr_test)

  function new(string name="ibex_core_irq_csr_test", uvm_component parent=null);
    super.new(name, parent);
  endfunction

  virtual task execute_vseq();
    ibex_random_interrupt_vseq vseq = ibex_random_interrupt_vseq::type_id::create("vseq");
    vseq.start(env.vsqr);
  endtask
endclass

`endif // __IBEX_CORE_IRQ_CSR_TEST_SV__
