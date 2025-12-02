`ifndef __UVMA_SIMPLE_MEM_PKG_SV__
`define __UVMA_SIMPLE_MEM_PKG_SV__

package uvma_simple_mem_pkg;

  import uvm_pkg::*;
  import uvml_mem_pkg::*;
  `include "uvm_macros.svh"

  `include "uvma_simple_mem_defs.sv"
  `include "uvma_simple_mem_seq_item.sv"
  `include "uvma_simple_mem_cfg.sv"
  `include "uvma_simple_mem_cntxt.sv"
  `include "uvma_simple_mem_sqr.sv"
  `include "uvma_simple_mem_drv.sv"
  `include "uvma_simple_mem_mon.sv"
  `include "uvma_simple_mem_resp_seq.sv"
  `include "uvma_simple_mem_agent.sv"

endpackage : uvma_simple_mem_pkg

`endif // __UVMA_SIMPLE_MEM_PKG_SV__
