`ifndef __UVMA_INTERRUPT_IF_SV__
`define __UVMA_INTERRUPT_IF_SV__

interface uvma_interrupt_if (input logic clk, input logic rst_n);
  timeunit 1ns;
  timeprecision 1ps;
  
  import uvma_interrupt_pkg::UVMA_IRQ_EXTERNAL_ID;
  import uvma_interrupt_pkg::UVMA_IRQ_FAST_BASE_ID;
  import uvma_interrupt_pkg::UVMA_IRQ_NMI_ID;
  import uvma_interrupt_pkg::UVMA_IRQ_SOFTWARE_ID;
  import uvma_interrupt_pkg::UVMA_IRQ_TIMER_ID;

  // Lado do UVM (Vetor plano para facilitar o Driver)
  logic [31:0] irq_vector;

  // Lado do DUT (Pinos específicos do Ibex)
  logic        irq_software;
  logic        irq_timer;
  logic        irq_external;
  logic [14:0] irq_fast;
  logic        irq_nm;

  // Roteamento: Mapeando os bits do UVM para os pinos do Ibex
  assign irq_software = irq_vector[UVMA_IRQ_SOFTWARE_ID       ];
  assign irq_timer    = irq_vector[UVMA_IRQ_TIMER_ID          ];
  assign irq_external = irq_vector[UVMA_IRQ_EXTERNAL_ID       ];
  assign irq_fast     = irq_vector[UVMA_IRQ_FAST_BASE_ID +: 15];
  assign irq_nm       = irq_vector[UVMA_IRQ_NMI_ID            ];

  // Bloco do Driver (Apenas escreve no vetor)
  clocking drv_cb @(posedge clk);
    default output #2ns;
    output irq_vector;
  endclocking

  // Bloco do Monitor (Apenas lê do vetor)
  clocking mon_cb @(posedge clk);
    default input #1step;
    input irq_vector;
  endclocking

  // Modports de Segurança
  modport active (
    clocking drv_cb,
    input    rst_n
  );

  modport passive (
    clocking mon_cb,
    input    rst_n
  );

endinterface : uvma_interrupt_if

`endif // __UVMA_INTERRUPT_IF_SV__
