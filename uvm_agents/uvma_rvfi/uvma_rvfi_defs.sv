`ifndef __UVMA_RVFI_TDEFS_SV__
`define __UVMA_RVFI_TDEFS_SV__

// RISC-V privilege modes can be defined here, for example
typedef enum bit [1:0] {
  UVMA_RVFI_MODE_U = 2'b00, // User Mode
  UVMA_RVFI_MODE_S = 2'b01, // Supervisor Mode
  UVMA_RVFI_MODE_M = 2'b11  // Machine Mode (Ibex default)
} uvma_rvfi_priv_mode_e;

`endif // __UVMA_RVFI_TDEFS_SV__