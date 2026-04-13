`ifndef __UVMA_INTERRUPT_MON_SV__
`define __UVMA_INTERRUPT_MON_SV__

class uvma_interrupt_mon extends uvm_monitor;

  uvma_interrupt_cfg   cfg;
  uvma_interrupt_cntxt cntxt;

  // TLM Analysis Port (Avisa o Coverage Model ou Scoreboard)
  uvm_analysis_port#(uvma_interrupt_mon_trn) ap;

  `uvm_component_utils_begin(uvma_interrupt_mon)
    `uvm_field_object(cfg  , UVM_DEFAULT)
    `uvm_field_object(cntxt, UVM_DEFAULT)
  `uvm_component_utils_end

  function new(string name="uvma_interrupt_mon", uvm_component parent=null);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    if (!uvm_config_db#(uvma_interrupt_cfg)::get(this, "", "cfg", cfg)) begin
      `uvm_fatal("CFG", "Configuration handle is null")
    end

    if (!uvm_config_db#(uvma_interrupt_cntxt)::get(this, "", "cntxt", cntxt)) begin
      `uvm_fatal("CNTXT", "Context handle is null")
    end

    ap = new("ap", this);
  endfunction

  // =========================================================================
  // RUN PHASE
  // =========================================================================
  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);

    if (cfg.enabled) begin
      while (1) begin
        // 1. Espera o reset descer e subir
        wait (cntxt.vif.rst_n === 1'b0);
        wait (cntxt.vif.rst_n === 1'b1);

        // 2. Lança a thread de monitoramento paralela
        fork
          begin
            monitor_irq_pins();
          end
        join_none

        // 3. Se o reset cair de novo no meio do teste, mata a thread e recomeça
        wait (cntxt.vif.rst_n === 1'b0);
        disable fork;
      end
    end
  endtask

  // =========================================================================
  // MONITORAMENTO DE BORDAS (EDGE DETECTION)
  // =========================================================================
  virtual task monitor_irq_pins();
    logic [31:0] prev_irq_vector;
    uvma_interrupt_mon_trn trn;

    // Amostra o estado inicial
    @(cntxt.vif.mon_cb);
    prev_irq_vector = cntxt.vif.mon_cb.irq_vector;

    while(1) begin
      @(cntxt.vif.mon_cb);
      
      // Se os pinos mudaram de valor (alguma IRQ foi asserida ou desasserida)
      if (cntxt.vif.mon_cb.irq_vector !== prev_irq_vector) begin
        // Cria a transação e copia o valor atual
        trn = uvma_interrupt_mon_trn::type_id::create("trn");
        trn.irq_vector = cntxt.vif.mon_cb.irq_vector;
        
        `uvm_info("IRQ_MON", $sformatf("Interrupt state changed! New Vector: 0x%08x", trn.irq_vector), UVM_HIGH);
        
        // Publica na porta de análise
        ap.write(trn);
        
        // Atualiza o estado anterior
        prev_irq_vector = cntxt.vif.mon_cb.irq_vector;
      end
    end
  endtask

endclass : uvma_interrupt_mon

`endif // __UVMA_INTERRUPT_MON_SV__