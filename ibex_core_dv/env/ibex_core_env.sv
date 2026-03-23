`ifndef __IBEX_CORE_ENV_SV__
`define __IBEX_CORE_ENV_SV__

class ibex_core_env extends uvm_env;
  `uvm_component_utils(ibex_core_env)

  // Memory Model (Shared Resource)
  uvml_mem shared_mem;

  // Agents Handles
  uvma_clk_rst_agent    clk_rst_agent;
  uvma_simple_mem_agent instr_mem_agent;
  uvma_simple_mem_agent data_mem_agent;
  uvma_rvfi_agent       rvfi_agent;

  // Context Handles
  uvma_simple_mem_cntxt instr_mem_cntxt;
  uvma_simple_mem_cntxt data_mem_cntxt;

  // Scoreboard and other shared resources can be declared here as needed.
  ibex_core_scoreboard scoreboard;

  function new(string name="ibex_core_env", uvm_component parent=null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    shared_mem = uvml_mem::type_id::create("shared_mem");

    // Instruction Agent Configuration
    instr_mem_cntxt = uvma_simple_mem_cntxt::type_id::create("instr_mem_cntxt");
    instr_mem_cntxt.mem_model = shared_mem; // Connect instruction port to shared memory
    uvm_config_db#(uvma_simple_mem_cntxt)::set(this, "instr_mem_agent*", "cntxt", instr_mem_cntxt);

    // Data Agent Configuration
    data_mem_cntxt = uvma_simple_mem_cntxt::type_id::create("data_mem_cntxt");
    data_mem_cntxt.mem_model = shared_mem;  // Connect data port to the SAME shared memory
    uvm_config_db#(uvma_simple_mem_cntxt)::set(this, "data_mem_agent*", "cntxt", data_mem_cntxt);

    // Agent Instantiation
    clk_rst_agent   = uvma_clk_rst_agent::type_id::create("clk_rst_agent", this);
    instr_mem_agent = uvma_simple_mem_agent::type_id::create("instr_mem_agent", this);
    data_mem_agent  = uvma_simple_mem_agent::type_id::create("data_mem_agent", this);
    rvfi_agent      = uvma_rvfi_agent::type_id::create("rvfi_agent", this);
    
    scoreboard      = ibex_core_scoreboard::type_id::create("scoreboard", this);

    `uvm_info("IBEX_CORE_ENV", "Environment Ibex built successfully.", UVM_LOW)
  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    rvfi_agent.ap.connect(scoreboard.rvfi_export);
  endfunction

endclass : ibex_core_env

`endif // __IBEX_CORE_ENV_SV__
