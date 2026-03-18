`ifndef __UVMA_RVFI_TDEFS_SV__
`define __UVMA_RVFI_TDEFS_SV__

// Aqui podemos guardar os Modos de Privilégio do RISC-V, por exemplo
typedef enum bit [1:0] {
  UVMA_RVFI_MODE_U = 2'b00, // User Mode
  UVMA_RVFI_MODE_S = 2'b01, // Supervisor Mode
  UVMA_RVFI_MODE_M = 2'b11  // Machine Mode (Padrão do Ibex)
} uvma_rvfi_priv_mode_e;

`endif // __UVMA_RVFI_TDEFS_SV__