`ifndef __IBEX_CORE_ENV_SV__
`define __IBEX_CORE_ENV_SV__

class ibex_core_env extends uvm_env;
  `uvm_component_utils(ibex_core_env)

  // Handles dos Agentes
  uvma_clk_rst_agent  clk_rst_agent;
  
  function new(string name="ibex_core_env", uvm_component parent=null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    // Instancia o agente
    clk_rst_agent = uvma_clk_rst_agent::type_id::create("clk_rst_agent", this);
    
    `uvm_info("IBEX_CORE_ENV", "Environment Ibex built successfully.", UVM_LOW)
  endfunction
endclass : ibex_core_env

`endif // __IBEX_CORE_ENV_SV__
