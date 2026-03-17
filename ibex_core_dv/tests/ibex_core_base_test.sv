`ifndef __IBEX_CORE_BASE_TEST_SV__
`define __IBEX_CORE_BASE_TEST_SV__

class ibex_core_base_test extends uvm_test;
  `uvm_component_utils(ibex_core_base_test)

  ibex_core_env    env;

  uvma_clk_rst_cfg    clk_rst_cfg;
  uvma_simple_mem_cfg instr_mem_cfg;
  uvma_simple_mem_cfg data_mem_cfg;

  function new(string name="ibex_core_base_test", uvm_component parent=null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    // Configure the Clock Agent to be ACTIVE
    clk_rst_cfg = uvma_clk_rst_cfg::type_id::create("clk_rst_cfg");
    clk_rst_cfg.is_active = UVM_ACTIVE;
    uvm_config_db#(uvma_clk_rst_cfg)::set(this, "env.clk_rst_agent*", "cfg", clk_rst_cfg);

    // Configure the Instruction Memory Agent to be ACTIVE
    instr_mem_cfg = uvma_simple_mem_cfg::type_id::create("instr_mem_cfg");
    instr_mem_cfg.is_active = UVM_ACTIVE;
    instr_mem_cfg.enabled   = 1;
    uvm_config_db#(uvma_simple_mem_cfg)::set(this, "env.instr_mem_agent*", "cfg", instr_mem_cfg);

    // Configure the Data Memory Agent to be ACTIVE
    data_mem_cfg = uvma_simple_mem_cfg::type_id::create("data_mem_cfg");
    data_mem_cfg.is_active = UVM_ACTIVE;
    data_mem_cfg.enabled   = 1;
    uvm_config_db#(uvma_simple_mem_cfg)::set(this, "env.data_mem_agent*", "cfg", data_mem_cfg);

    // Build the Environment
    env = ibex_core_env::type_id::create("env", this);
  endfunction

  // Print the UVM topology at the start of simulation (great for debugging)
  function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    uvm_top.print_topology();
  endfunction

  function void start_of_simulation_phase(uvm_phase phase);
    super.start_of_simulation_phase(phase);
    env.shared_mem.load_hex("../riscv_arithmetic_basic_test_0.hex");
  endfunction

  // Firing of Reactive Sequences (Background Daemons)
  task run_phase(uvm_phase phase);
    uvma_simple_mem_resp_seq instr_resp_seq;
    uvma_simple_mem_resp_seq data_resp_seq;
    
    super.run_phase(phase);
    
    instr_resp_seq = uvma_simple_mem_resp_seq::type_id::create("instr_resp_seq");
    data_resp_seq  = uvma_simple_mem_resp_seq::type_id::create("data_resp_seq");

    fork
      instr_resp_seq.start(env.instr_mem_agent.sequencer);
      data_resp_seq.start(env.data_mem_agent.sequencer);
    join_none
    
    `uvm_info("BASE_TEST", "Background Memory Sequences Started.", UVM_LOW)
  endtask

endclass : ibex_core_base_test

`endif // __IBEX_CORE_BASE_TEST_SV__