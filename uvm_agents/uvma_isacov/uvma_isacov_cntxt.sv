`ifndef __UVMA_ISACOV_CNTXT_SV__
`define __UVMA_ISACOV_CNTXT_SV__

class uvma_isacov_cntxt extends uvm_object;

  `uvm_object_utils(uvma_isacov_cntxt)

  // Eventos para sincronização (se o monitor precisar avisar o teste de algo raro)
  uvm_event sample_event;

  // Estatísticas de execução
  int unsigned num_instr_sampled = 0;
  int unsigned num_illegal_sampled = 0;

  function new(string name="uvma_isacov_cntxt");
    super.new(name);
    sample_event = new("sample_event");
  endfunction

endclass : uvma_isacov_cntxt

`endif // __UVMA_ISACOV_CNTXT_SV__
