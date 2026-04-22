`ifndef __UVMA_INTERRUPT_SQR_SV__
`define __UVMA_INTERRUPT_SQR_SV__

class uvma_interrupt_sqr extends uvm_sequencer#(uvma_interrupt_seq_item);
   
  `uvm_component_utils(uvma_interrupt_sqr)

  // Objetos de Configuração e Contexto
  uvma_interrupt_cfg   cfg;
  uvma_interrupt_cntxt cntxt;

  // Construtor
  function new(string name="uvma_interrupt_sqr", uvm_component parent=null);
    super.new(name, parent);
  endfunction

  // Build Phase
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    if (!uvm_config_db#(uvma_interrupt_cfg)::get(this, "", "cfg", cfg)) begin
        `uvm_fatal("CFG", "Configuration handle is null")
    end

    if (!uvm_config_db#(uvma_interrupt_cntxt)::get(this, "", "cntxt", cntxt)) begin
        `uvm_fatal("CNTXT", "Context handle is null")
    end
  endfunction

endclass : uvma_interrupt_sqr

`endif // __UVMA_INTERRUPT_SQR_SV__
