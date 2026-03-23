`ifndef __IBEX_CORE_SCOREBOARD_SV__
`define __IBEX_CORE_SCOREBOARD_SV__

class ibex_core_scoreboard extends uvm_scoreboard;
  `uvm_component_utils(ibex_core_scoreboard)

  // External port receiving transactions from RVFI Agent
  uvm_analysis_export #(uvma_rvfi_seq_item) rvfi_export;

  // Sub-componentes
  ibex_core_predictor  predictor;
  ibex_core_comparator comparator;

  function new(string name="ibex_core_scoreboard", uvm_component parent=null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    rvfi_export = new("rvfi_export", this);
    predictor   = ibex_core_predictor::type_id::create("predictor", this);
    comparator  = ibex_core_comparator::type_id::create("comparator", this);
  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    
    // 1. External RVFI stream goes into Predictor
    rvfi_export.connect(predictor.analysis_export);
    
    // 2. Predictor sends verdict to Comparator
    predictor.ap.connect(comparator.analysis_export);
  endfunction

endclass : ibex_core_scoreboard

`endif // __IBEX_CORE_SCOREBOARD_SV__
