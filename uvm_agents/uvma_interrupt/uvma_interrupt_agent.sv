`ifndef __UVMA_INTERRUPT_AGENT_SV__
`define __UVMA_INTERRUPT_AGENT_SV__

class uvma_interrupt_agent extends uvm_agent;

  uvma_interrupt_cfg   cfg;
  uvma_interrupt_cntxt cntxt;
  uvma_interrupt_drv   driver;
  uvma_interrupt_sqr   sequencer;
  uvma_interrupt_mon   monitor;

  // Registro na Factory
  `uvm_component_utils_begin(uvma_interrupt_agent)
    `uvm_field_object(cfg, UVM_DEFAULT)
  `uvm_component_utils_end

  // Construtor
  function new(string name="uvma_interrupt_agent", uvm_component parent=null);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    // 1. Resgata a Configuração
    if (!uvm_config_db#(uvma_interrupt_cfg)::get(this, "", "cfg", cfg)) begin
      `uvm_fatal("CFG", "Configuration handle is null")
    end

    // 2. Resgata ou Cria o Contexto (Para pegar a interface)
    if (!uvm_config_db#(uvma_interrupt_cntxt)::get(this, "", "cntxt", cntxt)) begin
      cntxt = uvma_interrupt_cntxt::type_id::create("cntxt");
      uvm_config_db#(uvma_interrupt_cntxt)::set(this, "*", "cntxt", cntxt);
    end

    // Resgata a VIF e injeta no Contexto
    if (!uvm_config_db#(virtual uvma_interrupt_if)::get(this, "", "vif", cntxt.vif)) begin
      `uvm_fatal("VIF", "Virtual Interface not found in uvm_config_db")
    end

    // 3. Cria os Sub-componentes
    if (cfg.enabled) begin
      monitor = uvma_interrupt_mon::type_id::create("monitor", this);
      
      if (cfg.is_active == UVM_ACTIVE) begin
        sequencer = uvma_interrupt_sqr::type_id::create("sequencer", this);
        driver    = uvma_interrupt_drv::type_id::create("driver", this);
      end
    end
  endfunction

  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    
    if (cfg.enabled) begin
      if (cfg.is_active == UVM_ACTIVE) begin
        driver.seq_item_port.connect(sequencer.seq_item_export);
      end
    end
  endfunction

endclass : uvma_interrupt_agent

`endif // __UVMA_INTERRUPT_AGENT_SV__
