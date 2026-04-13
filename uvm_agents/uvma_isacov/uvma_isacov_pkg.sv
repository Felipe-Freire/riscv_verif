`ifndef __UVMA_ISACOV_PKG_SV__
`define __UVMA_ISACOV_PKG_SV__

package uvma_isacov_pkg;

  import uvm_pkg::*;
  `include "uvm_macros.svh"

  import uvma_rvfi_pkg::*;

  `include "uvma_isacov_macros.sv"
  `include "uvma_isacov_const.sv"
  `include "uvma_isacov_defs.sv"

  `include "uvma_isacov_cfg.sv"
  `include "uvma_isacov_cntxt.sv"
  `include "uvma_isacov_instr.sv"

  `include "uvma_isacov_covergroups.svh"

  `include "uvma_isacov_mon_trn.sv"
  `include "uvma_isacov_cov.sv"
  `include "uvma_isacov_mon.sv"
  `include "uvma_isacov_agent.sv"

endpackage : uvma_isacov_pkg
  
`endif // __UVMA_ISACOV_PKG_SV__
