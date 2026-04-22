`ifndef __IBEX_CORE_VSQR_SV__
`define __IBEX_CORE_VSQR_SV__

class ibex_core_vsqr extends uvm_sequencer;
  `uvm_component_utils(ibex_core_vsqr)

  // Objects
  ibex_core_cfg       cfg;
  ibex_core_cntxt     cntxt;

  // Ponteiros para os sequencers locais dos agentes
  uvma_clk_rst_sqr    clk_rst_sqr;
  uvma_simple_mem_sqr instr_mem_sqr;
  uvma_simple_mem_sqr data_mem_sqr;
  uvma_interrupt_sqr  interrupt_sqr;

  function new(string name="ibex_core_vsqr", uvm_component parent=null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    if (!uvm_config_db#(ibex_core_cfg)::get(this, "", "cfg", cfg)) begin
      `uvm_fatal("CFG", "Failed to get configuration for ibex_core_vsqr");
    end

    if (!uvm_config_db#(ibex_core_cntxt)::get(this, "", "cntxt", cntxt)) begin
      `uvm_fatal("CNTXT", "Failed to get context for ibex_core_vsqr");
    end

  endfunction

endclass

`endif // __IBEX_CORE_VSQR_SV__
