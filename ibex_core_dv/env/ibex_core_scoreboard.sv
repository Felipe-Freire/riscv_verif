`ifndef __IBEX_CORE_SCOREBOARD_SV__
`define __IBEX_CORE_SCOREBOARD_SV__

`uvm_analysis_imp_decl(_interrupt)

class ibex_core_scoreboard extends uvm_scoreboard;
  `uvm_component_utils(ibex_core_scoreboard)

  // External ports
  uvm_analysis_export #(uvma_rvfi_seq_item) rvfi_export;
  uvm_analysis_imp_interrupt #(uvma_interrupt_mon_trn, ibex_core_scoreboard) interrupt_export;

  // Sub-componentes
  ibex_core_predictor  predictor;
  ibex_core_comparator comparator;

  chandle spike_handle;

  function new(string name="ibex_core_scoreboard", uvm_component parent=null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    rvfi_export = new("rvfi_export", this);
    interrupt_export = new("interrupt_export", this);

    predictor   = ibex_core_predictor::type_id::create("predictor", this);
    comparator  = ibex_core_comparator::type_id::create("comparator", this);

    if (!uvm_config_db#(chandle)::get(this, "", "spike_handle", spike_handle)) begin
      `uvm_fatal("SCOREBOARD", "Spike pointer (spike_handle) not found!")
    end
  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    
    // 1. External RVFI stream goes into Predictor
    rvfi_export.connect(predictor.analysis_export);
    
    // 2. Predictor sends verdict to Comparator
    predictor.ap.connect(comparator.analysis_export);
  endfunction

  // This directly processes the interrupt transaction synchronously in zero time
  virtual function void write_interrupt(uvma_interrupt_mon_trn int_trn);
    `uvm_info("SCOREBOARD", $sformatf("Received Interrupt. Mask: 0x%08x, Vector: 0x%08x. Synchronizing Spike...", int_trn.irq_mask, int_trn.irq_vector), UVM_LOW)
    
    // Send the interrupt directly to Spike C++ Reference Model (DPI-C)
    // using the exact mask to only affect the pins that changed.
    // riscv_cosim_set_interrupt(spike_handle, int_trn.irq_mask, int_trn.irq_vector);
  endfunction

endclass : ibex_core_scoreboard

`endif // __IBEX_CORE_SCOREBOARD_SV__
