`ifndef __IBEX_CORE_NMI_TEST_SV__
`define __IBEX_CORE_NMI_TEST_SV__

/**
 * Class: ibex_core_nmi_test
 *
 * Test that injects Non-Maskable Interrupts (NMI) during standard program
 * execution. Targets the irq_nm_i coverage hole in ibex_top.sv's clock_en
 * expression.
 *
 * Uses riscv-dv generated stimulus (which includes mtvec handler setup)
 * combined with the ibex_core_nmi_vseq to assert irq_nm_i at random points.
 */
class ibex_core_nmi_test extends ibex_core_base_test;
  `uvm_component_utils(ibex_core_nmi_test)

  function new(string name="ibex_core_nmi_test", uvm_component parent=null);
    super.new(name, parent);
  endfunction

  virtual task execute_vseq();
    ibex_core_nmi_vseq nmi_vseq;

    `uvm_info("NMI_TEST", "Starting NMI injection test sequence...", UVM_LOW)
    nmi_vseq = ibex_core_nmi_vseq::type_id::create("nmi_vseq");
    nmi_vseq.start(env.vsqr);
  endtask

endclass : ibex_core_nmi_test

`endif // __IBEX_CORE_NMI_TEST_SV__
