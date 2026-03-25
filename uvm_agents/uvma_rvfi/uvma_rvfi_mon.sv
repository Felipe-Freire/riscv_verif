`ifndef __UVMA_RVFI_MON_SV__
`define __UVMA_RVFI_MON_SV__

class uvma_rvfi_mon extends uvm_monitor;
  `uvm_component_utils(uvma_rvfi_mon)

  uvma_rvfi_cfg   cfg;
  uvma_rvfi_cntxt cntxt;

  // Porta para enviar os dados capturados para o Scoreboard
  uvm_analysis_port#(uvma_rvfi_seq_item) ap;

  function new(string name="uvma_rvfi_mon", uvm_component parent=null);
    super.new(name, parent);
    ap = new("ap", this);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    if (!uvm_config_db#(uvma_rvfi_cfg)::get(this, "", "cfg", cfg))
      `uvm_fatal("CFG", "RVFI Monitor nao encontrou a CFG")
      
    if (!uvm_config_db#(uvma_rvfi_cntxt)::get(this, "", "cntxt", cntxt))
      `uvm_fatal("CNTXT", "RVFI Monitor nao encontrou o CNTXT")
  endfunction

  task run_phase(uvm_phase phase);
    uvma_rvfi_seq_item trn;
    
    // Padrão de Reset UVM Robusto:
    // 1. Espera o pino ir para 0 (Reset Ativo) ou já estar em 0
    wait (cntxt.vif.rst_n === 1'b0);
    // 2. Espera o pino ir para 1 (Saindo do Reset)
    wait (cntxt.vif.rst_n === 1'b1);

    `uvm_info("RVFI_MON", "Reset concluido. Monitor Ativo e escutando o barramento!", UVM_LOW)

    forever begin
      // Sincroniza com a borda de clock do monitor (olhando para o passado)
      @(cntxt.vif.mon_cb);

      // A Mágica: O Ibex diz que acabou de comitar uma instrução
      if (cntxt.vif.mon_cb.rvfi_valid === 1'b1) begin
        trn = uvma_rvfi_seq_item::type_id::create("trn");

        // Captura a foto exata do pipeline
        trn.order     = cntxt.vif.mon_cb.rvfi_order;
        trn.insn      = cntxt.vif.mon_cb.rvfi_insn;
        trn.trap      = cntxt.vif.mon_cb.rvfi_trap;
        trn.pc_rdata  = cntxt.vif.mon_cb.rvfi_pc_rdata;
        trn.pc_wdata  = cntxt.vif.mon_cb.rvfi_pc_wdata;
        
        trn.rs1_addr  = cntxt.vif.mon_cb.rvfi_rs1_addr;
        trn.rs1_rdata = cntxt.vif.mon_cb.rvfi_rs1_rdata;
        trn.rs2_addr  = cntxt.vif.mon_cb.rvfi_rs2_addr;
        trn.rs2_rdata = cntxt.vif.mon_cb.rvfi_rs2_rdata;
        trn.rd_addr   = cntxt.vif.mon_cb.rvfi_rd_addr;
        trn.rd_wdata  = cntxt.vif.mon_cb.rvfi_rd_wdata;

        trn.mem_addr  = cntxt.vif.mon_cb.rvfi_mem_addr;
        trn.mem_rmask = cntxt.vif.mon_cb.rvfi_mem_rmask;
        trn.mem_rdata = cntxt.vif.mon_cb.rvfi_mem_rdata;
        trn.mem_wmask = cntxt.vif.mon_cb.rvfi_mem_wmask;
        trn.mem_wdata = cntxt.vif.mon_cb.rvfi_mem_wdata;

        // Imprime a nossa string formatada bonita
        `uvm_info("RVFI_MON", trn.convert2string(), UVM_HIGH)

        // Dispara para o Scoreboard!
        ap.write(trn);
      end
    end
  endtask

endclass : uvma_rvfi_mon

`endif // __UVMA_RVFI_MON_SV__