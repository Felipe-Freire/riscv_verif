`ifndef __IBEX_INTERRUPT_TEST_VSEQ_SV__
`define __IBEX_INTERRUPT_TEST_VSEQ_SV__

/**
 * Class: ibex_interrupt_test_vseq
 * Virtual sequence to perform boot and then trigger a dynamic interrupt.
 */
class ibex_interrupt_test_vseq extends ibex_core_base_vseq;

  `uvm_object_utils(ibex_interrupt_test_vseq)

  /**
   * Function: new
   * Standard UVM object constructor.
   */
  function new(string name="ibex_interrupt_test_vseq");
    super.new(name);
  endfunction

  /**
   * Task: body
   * Main virtual sequence orchestration.
   */
  virtual task body();
    ibex_core_boot_vseq      boot_vseq;
    uvma_interrupt_seq_item  req_assert;
    uvma_interrupt_seq_item  req_deassert;
    int unsigned             wait_cycles;

    // 1. Perform Boot behavior
    `uvm_info("INT_TEST_VSEQ", "Executing boot sequence...", UVM_LOW)
    boot_vseq = ibex_core_boot_vseq::type_id::create("boot_vseq");
    boot_vseq.start(p_sequencer);

    // 2. Sorteia um tempo de espera (ex: entre 500 e 2000 ciclos de clock)
    // Isso garante que o software teve tempo de configurar os CSRs e está no loop principal.
    wait_cycles = $urandom_range(500, 2000);
    `uvm_info("INT_TEST_VSEQ", $sformatf("Waiting %0d clock cycles before triggering interrupt...", wait_cycles), UVM_LOW)
    
    // Supondo que você tem um sequencer de clock (ou faça um loop de delays se não tiver)
    // O ideal é esperar na interface de clock. Como estamos na VSEQ, usamos o sequencer.
    // Se o seu vsqr não tiver ponteiro para o clock, você pode manter um delay proporcional.
    repeat(wait_cycles) #10ns; // Substitua #10ns pelo período do seu clock se for diferente

    // 3. ASSERT: Dispara a Interrupção
    `uvm_info("INT_TEST_VSEQ", "Triggering TIMER interrupt (ASSERT)...", UVM_LOW)
    `uvm_do_on_with(req_assert, p_sequencer.interrupt_sqr, { 
      action == UVMA_INTERRUPT_SEQ_ITEM_ACTION_ASSERT; 
      irq_mask == 32'h0000_0080; // Pino 7 (Timer)
    })

    // 4. HOLD: Mantém o pino alto tempo suficiente para o Ibex pular para o Handler
    // Simulando o tempo que o software demora para responder e mandar o periférico baixar o pino
    // Aumentado drasticamente para evitar que a VSEQ baixe o pino antes do RTL aceitar a interrupção.
    wait_cycles = $urandom_range(300, 500);
    `uvm_info("INT_TEST_VSEQ", $sformatf("Holding interrupt for %0d cycles...", wait_cycles), UVM_LOW)
    repeat(wait_cycles) #10ns;

    // 5. DEASSERT: Abaixa o pino (A etapa salva-vidas!)
    `uvm_info("INT_TEST_VSEQ", "Removing TIMER interrupt (DEASSERT)...", UVM_LOW)
    `uvm_do_on_with(req_deassert, p_sequencer.interrupt_sqr, { 
      action == UVMA_INTERRUPT_SEQ_ITEM_ACTION_DEASSERT; 
      irq_mask == 32'h0000_0080; // Abaixa o mesmo Pino 7
    })

    `uvm_info("INT_TEST_VSEQ", "Interrupt sequence item finished. Waiting for software MRET...", UVM_LOW)
  endtask

endclass

`endif // __IBEX_INTERRUPT_TEST_VSEQ_SV__
