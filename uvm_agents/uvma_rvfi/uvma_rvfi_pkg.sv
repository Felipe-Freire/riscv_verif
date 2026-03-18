`ifndef __UVMA_RVFI_PKG_SV__
`define __UVMA_RVFI_PKG_SV__

package uvma_rvfi_pkg;
   
  import uvm_pkg::*;
  `include "uvm_macros.svh"
  
  `include "uvma_rvfi_defs.sv"
  `include "uvma_rvfi_cfg.sv"
  `include "uvma_rvfi_cntxt.sv"
  `include "uvma_rvfi_seq_item.sv"
  
  `include "uvma_rvfi_mon.sv"
  `include "uvma_rvfi_agent.sv"

endpackage : uvma_rvfi_pkg

`endif // __UVMA_RVFI_PKG_SV__
