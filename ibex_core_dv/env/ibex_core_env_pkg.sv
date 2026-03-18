`ifndef __IBEX_CORE_ENV_PKG_SV__
`define __IBEX_CORE_ENV_PKG_SV__

package ibex_core_env_pkg;

  // 1. UVM Base
  import uvm_pkg::*;
  `include "uvm_macros.svh"

  // 2. Agents that the Env will instantiate
  import uvma_clk_rst_pkg::*;
  import uvml_mem_pkg::*;
  import uvma_simple_mem_pkg::*;
  import uvma_rvfi_pkg::*;

  // 3. Inclusion of Env classes
  `include "ibex_core_env.sv"

endpackage : ibex_core_env_pkg

`endif // __IBEX_CORE_ENV_PKG_SV__
