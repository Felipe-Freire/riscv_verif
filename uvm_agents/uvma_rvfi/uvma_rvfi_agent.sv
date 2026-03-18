`ifndef __UVMA_RVFI_AGENT_SV__
`define __UVMA_RVFI_AGENT_SV__

class uvma_rvfi_agent extends uvm_agent;
  `uvm_component_utils(uvma_rvfi_agent)

  uvma_rvfi_cfg   cfg;
  uvma_rvfi_cntxt cntxt;
  uvma_rvfi_mon   monitor;

  // A porta de saída do Agente (conecta ao Env -> Scoreboard)
  uvm_analysis_port#(uvma_rvfi_seq_item) ap;

  function new(string name="uvma_rvfi_agent", uvm_component parent=null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    // Take Config
    if(!uvm_config_db#(uvma_rvfi_cfg)::get(this, "", "cfg", cfg))
      `uvm_fatal("CFG", "RVFI Agent precisa de uma CFG")

    // Manage Context (Create if it doesn't exist)
    if(!uvm_config_db#(uvma_rvfi_cntxt)::get(this, "", "cntxt", cntxt)) begin
      cntxt = uvma_rvfi_cntxt::type_id::create("cntxt");
      uvm_config_db#(uvma_rvfi_cntxt)::set(this, "*", "cntxt", cntxt);
    end

    // Get Virtual Interface
    if(!uvm_config_db#(virtual uvma_rvfi_instr_if)::get(this, "", "vif", cntxt.vif))
      `uvm_fatal("VIF", "RVFI Agent precisa de uma interface")
    
    // Constrói o Monitor e a porta de saída
    monitor = uvma_rvfi_mon::type_id::create("monitor", this);
    ap      = new("ap", this);
  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    monitor.ap.connect(this.ap);
  endfunction

endclass : uvma_rvfi_agent

`endif // __UVMA_RVFI_AGENT_SV__
