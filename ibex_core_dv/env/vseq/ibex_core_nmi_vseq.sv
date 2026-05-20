`ifndef __IBEX_CORE_NMI_VSEQ_SV__
`define __IBEX_CORE_NMI_VSEQ_SV__

/**
 * Class: ibex_core_nmi_vseq
 *
 * Virtual sequence that injects Non-Maskable Interrupts (NMI) via the existing
 * interrupt agent infrastructure. Targets the irq_nm_i coverage hole in the
 * clock_en expression of ibex_top.sv (line 246):
 *
 *   assign clock_en = core_busy_q[0] | debug_req_i | irq_pending | irq_nm_i;
 *
 * Cosim note: No additional DPI calls are needed. The RVFI monitor captures
 * ext_nmi / ext_nmi_int from the RTL, and the predictor already calls
 * riscv_cosim_set_nmi() before stepping Spike.
 *
 * The NMI is routed through uvma_interrupt_if:
 *   irq_vector[UVMA_IRQ_NMI_ID] -> assign irq_nm = irq_vector[31]
 *   -> ibex_core_tb_top: .irq_nm_i(interrupt_if.irq_nm)
 */
class ibex_core_nmi_vseq extends ibex_core_base_vseq;

  `uvm_object_utils(ibex_core_nmi_vseq)

  // Configurable knobs
  rand int unsigned num_nmi_pulses;
  rand int unsigned pre_nmi_wait_min;
  rand int unsigned pre_nmi_wait_max;
  rand int unsigned nmi_hold_min;
  rand int unsigned nmi_hold_max;

  constraint default_timing_cons {
    soft num_nmi_pulses   inside {[1:3]};
    soft pre_nmi_wait_min == 500;
    soft pre_nmi_wait_max == 3000;
    soft nmi_hold_min     == 50;
    soft nmi_hold_max     == 200;
    pre_nmi_wait_max >= pre_nmi_wait_min;
    nmi_hold_max     >= nmi_hold_min;
  }

  function new(string name="ibex_core_nmi_vseq");
    super.new(name);
  endfunction

  virtual task body();
    ibex_core_boot_vseq      boot_vseq;
    uvma_interrupt_seq_item  req_assert;
    uvma_interrupt_seq_item  req_deassert;
    int unsigned             wait_cycles;
    int unsigned             hold_cycles;

    // NMI mask: bit 31 = UVMA_IRQ_NMI_ID
    bit [31:0] nmi_mask = (32'h1 << UVMA_IRQ_NMI_ID);

    // 1. Boot the system
    `uvm_info("NMI_VSEQ", "Executing boot sequence...", UVM_LOW)
    boot_vseq = ibex_core_boot_vseq::type_id::create("boot_vseq");
    boot_vseq.start(p_sequencer);

    // 2. Inject NMI pulses
    for (int i = 0; i < num_nmi_pulses; i++) begin
      // Wait for the core to execute some instructions
      wait_cycles = $urandom_range(pre_nmi_wait_min, pre_nmi_wait_max);
      `uvm_info("NMI_VSEQ", $sformatf(
          "NMI pulse %0d/%0d: waiting %0d cycles before assertion...",
          i+1, num_nmi_pulses, wait_cycles), UVM_LOW)
      repeat(wait_cycles) #10ns;

      // Assert NMI
      `uvm_info("NMI_VSEQ", $sformatf(
          "Asserting NMI (irq_vector[%0d]) with mask 0x%08x",
          UVMA_IRQ_NMI_ID, nmi_mask), UVM_LOW)
      `uvm_do_on_with(req_assert, p_sequencer.interrupt_sqr, {
          action   == UVMA_INTERRUPT_SEQ_ITEM_ACTION_ASSERT;
          irq_mask == local::nmi_mask;
        })

      // Hold NMI active (Ibex latches NMI internally, but we hold for
      // a few cycles to ensure the edge is captured reliably)
      hold_cycles = $urandom_range(nmi_hold_min, nmi_hold_max);
      `uvm_info("NMI_VSEQ", $sformatf("Holding NMI for %0d cycles...", hold_cycles), UVM_LOW)
      repeat(hold_cycles) #10ns;

      // Deassert NMI
      `uvm_info("NMI_VSEQ", "Deasserting NMI...", UVM_LOW)
      `uvm_do_on_with(req_deassert, p_sequencer.interrupt_sqr, {
          action   == UVMA_INTERRUPT_SEQ_ITEM_ACTION_DEASSERT;
          irq_mask == local::nmi_mask;
        })
    end

    `uvm_info("NMI_VSEQ", $sformatf(
        "All %0d NMI pulses injected. Waiting for software to recover...",
        num_nmi_pulses), UVM_LOW)
  endtask

endclass

`endif // __IBEX_CORE_NMI_VSEQ_SV__
