`ifndef __IBEX_RANDOM_INTERRUPT_VSEQ_SV__
`define __IBEX_RANDOM_INTERRUPT_VSEQ_SV__

/**
 * Class: ibex_random_interrupt_vseq
 * Virtual sequence to perform boot and then trigger a dynamic random interrupt.
 */
class ibex_random_interrupt_vseq extends ibex_core_base_vseq;

  `uvm_object_utils(ibex_random_interrupt_vseq)

  function new(string name="ibex_random_interrupt_vseq");
    super.new(name);
  endfunction

  virtual task body();
    ibex_core_boot_vseq      boot_vseq;
    uvma_interrupt_seq_item  req_assert;
    uvma_interrupt_seq_item  req_deassert;
    int unsigned             wait_cycles;
    bit [31:0]               rand_irq_mask;
    int                      irq_choice;

    // 1. Perform Boot behavior
    `uvm_info("RAND_INT_VSEQ", "Executing boot sequence...", UVM_LOW)
    boot_vseq = ibex_core_boot_vseq::type_id::create("boot_vseq");
    boot_vseq.start(p_sequencer);

    wait_cycles = $urandom_range(500, 2000);
    `uvm_info("RAND_INT_VSEQ", $sformatf("Waiting %0d clock cycles before triggering interrupt...", wait_cycles), UVM_LOW)
    repeat(wait_cycles) #10ns;

    // Pick a random interrupt source
    irq_choice = $urandom_range(0, 3);
    case (irq_choice)
      0: rand_irq_mask = 32'h0000_0008; // Software (Pin 3)
      1: rand_irq_mask = 32'h0000_0080; // Timer (Pin 7)
      2: rand_irq_mask = 32'h0000_0800; // External (Pin 11)
      3: rand_irq_mask = 32'h0001_0000; // Fast Interrupt 0 (Pin 16)
      default: rand_irq_mask = 32'h0000_0080;
    endcase

    // 3. ASSERT: Trigger the Interrupt
    `uvm_info("RAND_INT_VSEQ", $sformatf("Triggering random interrupt (ASSERT) with mask 0x%08x...", rand_irq_mask), UVM_LOW)
    `uvm_do_on_with(req_assert, p_sequencer.interrupt_sqr, {
        action == UVMA_INTERRUPT_SEQ_ITEM_ACTION_ASSERT;
        irq_mask == local::rand_irq_mask;
      })

    // 4. HOLD
    wait_cycles = $urandom_range(300, 500);
    `uvm_info("RAND_INT_VSEQ", $sformatf("Holding interrupt for %0d cycles...", wait_cycles), UVM_LOW)
    repeat(wait_cycles) #10ns;

    // 5. DEASSERT
    `uvm_info("RAND_INT_VSEQ", "Removing interrupt (DEASSERT)...", UVM_LOW)
    `uvm_do_on_with(req_deassert, p_sequencer.interrupt_sqr, {
        action == UVMA_INTERRUPT_SEQ_ITEM_ACTION_DEASSERT;
        irq_mask == local::rand_irq_mask;
      })

    `uvm_info("RAND_INT_VSEQ", "Interrupt sequence item finished. Waiting for software MRET...", UVM_LOW)
  endtask

endclass

`endif // __IBEX_RANDOM_INTERRUPT_VSEQ_SV__
