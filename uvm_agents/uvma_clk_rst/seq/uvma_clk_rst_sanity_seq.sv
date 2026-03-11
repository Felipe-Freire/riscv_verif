`ifndef __UVMA_CLK_RST_SANITY_SEQ_SV__
`define __UVMA_CLK_RST_SANITY_SEQ_SV__

class uvma_clk_rst_sanity_seq extends uvma_clk_rst_base_seq;

  `uvm_object_utils(uvma_clk_rst_sanity_seq)

  function new(string name="uvma_clk_rst_sanity_seq");
    super.new(name);
  endfunction

  task body();
    uvma_clk_rst_seq_item req;
    
    `uvm_info("CLK_RST_SEQ", "Iniciando a sequencia de inicializacao (Sanity)...", UVM_LOW)

    // --- Passo 1: Configurar e Ligar o Clock ---
    req = uvma_clk_rst_seq_item::type_id::create("req");
    start_item(req);
    req.action        = UVMA_CLK_RST_SEQ_ITEM_ACTION_START_CLK;
    req.new_period_ps = 10000; // 100 MHz
    finish_item(req);

    `uvm_info("CLK_RST_SEQ", "Clock iniciado com periodo de 10ns.", UVM_HIGH)

    // --- Passo 2: Aplicar o Reset ---
    // Em hardware real, o reset precisa ser mantido ativo por alguns ciclos de clock
    req = uvma_clk_rst_seq_item::type_id::create("req");
    start_item(req);
    req.action            = UVMA_CLK_RST_SEQ_ITEM_ACTION_ASSERT_RESET;
    req.reset_duration_ps = 50000; // Mantem o reset em 0 por 50ns (5 ciclos)
    finish_item(req);

    `uvm_info("CLK_RST_SEQ", "Reset aplicado e liberado com sucesso.", UVM_HIGH)
    
  endtask

endclass : uvma_clk_rst_sanity_seq

`endif // __UVMA_CLK_RST_SANITY_SEQ_SV__