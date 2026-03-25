`ifndef __IBEX_CORE_TEST_PKG_SV__
`define __IBEX_CORE_TEST_PKG_SV__

package ibex_core_test_pkg;

  // UVM Base
  import uvm_pkg::*;
  `include "uvm_macros.svh"

  // Test Dependencies
  import uvma_clk_rst_pkg::*;
  import uvml_mem_pkg::*;
  import uvma_simple_mem_pkg::*;
  import uvma_rvfi_pkg::*;
  import uvma_isacov_pkg::*;
  import ibex_core_env_pkg::*;

  `include "cosim_dpi.svh"

  // Test classes for the ibex core test environment
  `include "ibex_core_base_test.sv"
  `include "ibex_core_sanity_test.sv"

endpackage : ibex_core_test_pkg

`endif // __IBEX_CORE_TEST_PKG_SV__
