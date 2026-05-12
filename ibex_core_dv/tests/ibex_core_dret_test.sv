`ifndef __IBEX_CORE_DRET_TEST_SV__
`define __IBEX_CORE_DRET_TEST_SV__

class ibex_core_dret_test extends ibex_core_base_test;
  `uvm_component_utils(ibex_core_dret_test)
  function new(string name="ibex_core_dret_test", uvm_component parent=null);
    super.new(name, parent);
  endfunction
  // Inherits default execute_vseq(), relying on RTL and Spike to natively trap DRET exceptions
endclass

`endif // __IBEX_CORE_DRET_TEST_SV__
