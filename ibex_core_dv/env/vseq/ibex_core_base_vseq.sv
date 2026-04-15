`ifndef __IBEX_CORE_BASE_VSEQ_SV__
`define __IBEX_CORE_BASE_VSEQ_SV__

/**
 * Class: ibex_core_base_vseq
 * Base virtual sequence for Ibex Core environment.
 * Provides handles to p_sequencer components and encapsulates common logic.
 */
class ibex_core_base_vseq extends uvm_sequence;

  `uvm_object_utils(ibex_core_base_vseq)
  `uvm_declare_p_sequencer(ibex_core_vsqr)

  // Local handles to configuration and context for easy access
  ibex_core_cfg   cfg;
  ibex_core_cntxt cntxt;

  /**
   * Function: new
   * Standard UVM object constructor.
   */
  function new(string name="ibex_core_base_vseq");
    super.new(name);
  endfunction

  /**
   * Task: pre_body
   * Executed before body(). Pulls handles from the virtual sequencer (p_sequencer).
   */
  virtual task pre_body();
    super.pre_body();
    if (p_sequencer != null) begin
      cfg   = p_sequencer.cfg;
      cntxt = p_sequencer.cntxt;
    end else begin
      `uvm_fatal("VSEQ_NULL_SQRE", "p_sequencer is null in pre_body()!")
    end
  endtask

endclass

`endif // __IBEX_CORE_BASE_VSEQ_SV__
