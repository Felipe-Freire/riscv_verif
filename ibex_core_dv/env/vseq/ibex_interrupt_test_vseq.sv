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
    uvma_interrupt_seq_item  req;

    // 1. Perform Boot behavior
    `uvm_info("INT_TEST_VSEQ", "Executing boot sequence...", UVM_LOW)
    boot_vseq = ibex_core_boot_vseq::type_id::create("boot_vseq");
    boot_vseq.start(p_sequencer);

    // 2. Wait for system stabilization / execution
    `uvm_info("INT_TEST_VSEQ", "Waiting for 1000ns before triggering interrupt...", UVM_LOW)
    #1000ns;

    // 3. Instantiate and Trigger Interrupt
    `uvm_info("INT_TEST_VSEQ", "Triggering TIMER interrupt via Late Randomization...", UVM_LOW)
    req = uvma_interrupt_seq_item::type_id::create("req");

    // 4. Late Randomization (Strict adherence to GEMINI.md)
    if (!req.randomize() with { 
      action == UVMA_INTERRUPT_SEQ_ITEM_ACTION_ASSERT; 
      irq_mask == 32'h0000_0080; // Example: M-Timer Interrupt bit (IRQ 7)
    }) begin
      `uvm_fatal("VSEQ_RAND_FAIL", "Failed to randomize uvma_interrupt_seq_item")
    end

    // 5. Send to agent sequencer
    start_item(req, -1, p_sequencer.interrupt_sqr);
    finish_item(req);

    `uvm_info("INT_TEST_VSEQ", "Interrupt sequence item finished.", UVM_LOW)
  endtask

endclass

`endif // __IBEX_INTERRUPT_TEST_VSEQ_SV__
