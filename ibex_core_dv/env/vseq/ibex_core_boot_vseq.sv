`ifndef __IBEX_CORE_BOOT_VSEQ_SV__
`define __IBEX_CORE_BOOT_VSEQ_SV__

/**
 * Class: ibex_core_boot_vseq
 * Virtual sequence to perform initial system boot: Clock start, background memory
 * responses, and reset assertion.
 */
class ibex_core_boot_vseq extends ibex_core_base_vseq;

  `uvm_object_utils(ibex_core_boot_vseq)

  /**
   * Function: new
   * Standard UVM object constructor.
   */
  function new(string name="ibex_core_boot_vseq");
    super.new(name);
  endfunction

  /**
   * Task: body
   * Main virtual sequence orchestration.
   */
  virtual task body();
    uvma_clk_rst_start_clk_seq    start_clk_seq;
    uvma_clk_rst_assert_reset_seq assert_reset_seq;
    uvma_simple_mem_resp_seq      instr_mem_resp_seq;
    uvma_simple_mem_resp_seq      data_mem_resp_seq;

    // 1. Start Clock (Blocking)
    `uvm_info("BOOT_VSEQ", "Starting Clock Sequence...", UVM_LOW)
    start_clk_seq = uvma_clk_rst_start_clk_seq::type_id::create("start_clk_seq");
    start_clk_seq.start(p_sequencer.clk_rst_sqr);

    // 2. Fork memory responses to run in background
    `uvm_info("BOOT_VSEQ", "Launching background memory responses...", UVM_LOW)
    fork
      begin
        instr_mem_resp_seq = uvma_simple_mem_resp_seq::type_id::create("instr_mem_resp_seq");
        instr_mem_resp_seq.start(p_sequencer.instr_mem_sqr);
      end
      begin
        data_mem_resp_seq = uvma_simple_mem_resp_seq::type_id::create("data_mem_resp_seq");
        data_mem_resp_seq.start(p_sequencer.data_mem_sqr);
      end
    join_none

    // 3. Assert and release reset (Blocking)
    `uvm_info("BOOT_VSEQ", "Asserting system reset...", UVM_LOW)
    assert_reset_seq = uvma_clk_rst_assert_reset_seq::type_id::create("assert_reset_seq");
    assert_reset_seq.start(p_sequencer.clk_rst_sqr);

    `uvm_info("BOOT_VSEQ", "Boot sequence completed successfully.", UVM_LOW)
  endtask

endclass

`endif // __IBEX_CORE_BOOT_VSEQ_SV__
