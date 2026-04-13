`ifndef __UVMA_INTERRUPT_CONST_SV__
`define __UVMA_INTERRUPT_CONST_SV__

// --- Mapeamento oficial das interrupções RISC-V (Privileged Spec) e Ibex ---
parameter int UVMA_IRQ_SOFTWARE_ID  = 3;
parameter int UVMA_IRQ_TIMER_ID     = 7;
parameter int UVMA_IRQ_EXTERNAL_ID  = 11;
parameter int UVMA_IRQ_FAST_BASE_ID = 16;  // As Fast Interrupts do Ibex ficam nos bits 16 a 30 
parameter int UVMA_IRQ_NMI_ID       = 31;  // Non-Maskable Interrupt

`endif // __UVMA_INTERRUPT_CONST_SV__
