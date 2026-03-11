`ifndef __IBEX_CORE_BASE_TEST_SV__
`define __IBEX_CORE_BASE_TEST_SV__

class ibex_core_base_test extends uvm_test;
  `uvm_component_utils(ibex_core_base_test)

  ibex_core_env    env;
  uvma_clk_rst_cfg clk_rst_cfg;

  function new(string name="ibex_core_base_test", uvm_component parent=null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    // 1. Configure the Clock Agent to be ACTIVE
    clk_rst_cfg = uvma_clk_rst_cfg::type_id::create("clk_rst_cfg");
    clk_rst_cfg.is_active = UVM_ACTIVE;
    
    // Pass the configuration to the agent. Note the hierarchy "env.clk_rst_agent"
    uvm_config_db#(uvma_clk_rst_cfg)::set(this, "env.clk_rst_agent*", "cfg", clk_rst_cfg);

    // 2. Build the Environment
    env = ibex_core_env::type_id::create("env", this);
  endfunction
  
  // Print the UVM topology at the start of simulation (great for debugging)
  function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    uvm_top.print_topology();
  endfunction

endclass : ibex_core_base_test

`endif // __IBEX_CORE_BASE_TEST_SV__