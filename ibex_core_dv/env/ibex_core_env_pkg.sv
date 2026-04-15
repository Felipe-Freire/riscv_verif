`ifndef __IBEX_CORE_ENV_PKG_SV__
`define __IBEX_CORE_ENV_PKG_SV__

package ibex_core_env_pkg;

  // UVM Base
  import uvm_pkg::*;
  `include "uvm_macros.svh"

  // Agents that the Env will instantiate
  import uvma_clk_rst_pkg::*;
  import uvml_mem_pkg::*;
  import uvma_simple_mem_pkg::*;
  import uvma_interrupt_pkg::*;
  import uvma_rvfi_pkg::*;
  import uvma_isacov_pkg::*;

  // Dependency of the Env on the DPI functions
  `include "cosim_dpi.svh"

  // Inclusion of Env classes
  `include "ibex_core_cfg.sv"
  `include "ibex_core_cntxt.sv"
  `include "ibex_core_vsqr.sv"

  // Virtual Sequences
  `include "ibex_core_base_vseq.sv"
  `include "ibex_core_boot_vseq.sv"
  `include "ibex_interrupt_test_vseq.sv"
  `include "ibex_core_cosim_verdict.sv"
  `include "ibex_core_predictor.sv"
  `include "ibex_core_comparator.sv"
  `include "ibex_core_scoreboard.sv"
  `include "ibex_core_env.sv"

endpackage : ibex_core_env_pkg

`endif // __IBEX_CORE_ENV_PKG_SV__
