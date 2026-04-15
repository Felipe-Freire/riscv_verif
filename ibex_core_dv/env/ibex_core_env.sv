`ifndef __IBEX_CORE_ENV_SV__
`define __IBEX_CORE_ENV_SV__

class ibex_core_env extends uvm_env;

  // Objects
  ibex_core_cfg         cfg;
  ibex_core_cntxt       cntxt;

  // Components
  ibex_core_scoreboard  scoreboard;
  ibex_core_vsqr        vsqr;

  // Agents Handles
  uvma_clk_rst_agent    clk_rst_agent;
  uvma_simple_mem_agent instr_mem_agent;
  uvma_simple_mem_agent data_mem_agent;
  uvma_interrupt_agent  interrupt_agent;
  uvma_rvfi_agent       rvfi_agent;
  uvma_isacov_agent     isacov_agent;

  `uvm_component_utils_begin(ibex_core_env)
    `uvm_field_object(cfg,   UVM_DEFAULT)
    `uvm_field_object(cntxt, UVM_DEFAULT)
  `uvm_component_utils_end

  function new(string name="ibex_core_env", uvm_component parent=null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    // Create the configuration and context objects
    if (!uvm_config_db#(ibex_core_cfg)::get(this, "", "cfg", cfg)) begin
      `uvm_fatal("CFG", "Failed to get configuration for ibex_core_env");
    end

    if (!uvm_config_db#(ibex_core_cntxt)::get(this, "", "cntxt", cntxt)) begin
      cntxt = ibex_core_cntxt::type_id::create("cntxt");
      uvm_config_db#(ibex_core_cntxt)::set(this, "*", "cntxt", cntxt);
    end

    cntxt.data_mem_cntxt.mem_model  = cntxt.shared_mem; // Pass shared memory reference to data memory context
    cntxt.instr_mem_cntxt.mem_model = cntxt.shared_mem; // Pass shared memory reference to instruction memory context

    assign_cfg       ();
    assign_cntxt     ();
    create_agents    ();
    create_components();

    `uvm_info("IBEX_CORE_ENV", "Environment Ibex built successfully.", UVM_LOW)
  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    rvfi_agent.ap.connect(scoreboard.rvfi_export);
    rvfi_agent.ap.connect(isacov_agent.rvfi_export);
    connect_vsqr();
    interrupt_agent.ap.connect(scoreboard.interrupt_export);
  endfunction

  function void assign_cfg();
    uvm_config_db#(ibex_core_cfg      )::set(this, "*",                "cfg", cfg              );
    uvm_config_db#(uvma_clk_rst_cfg   )::set(this, "clk_rst_agent*",   "cfg", cfg.clk_rst_cfg  );
    uvm_config_db#(uvma_simple_mem_cfg)::set(this, "instr_mem_agent*", "cfg", cfg.instr_mem_cfg);
    uvm_config_db#(uvma_simple_mem_cfg)::set(this, "data_mem_agent*",  "cfg", cfg.data_mem_cfg );
    uvm_config_db#(uvma_rvfi_cfg      )::set(this, "rvfi_agent*",      "cfg", cfg.rvfi_cfg     );
    uvm_config_db#(uvma_isacov_cfg    )::set(this, "isacov_agent*",    "cfg", cfg.isacov_cfg   );
    uvm_config_db#(uvma_interrupt_cfg )::set(this, "interrupt_agent*", "cfg", cfg.interrupt_cfg);
  endfunction : assign_cfg

  function void assign_cntxt();
    uvm_config_db#(ibex_core_cntxt      )::set(this, "*",                "cntxt", cntxt                );
    uvm_config_db#(uvma_clk_rst_cntxt   )::set(this, "clk_rst_agent*",   "cntxt", cntxt.clk_rst_cntxt  );
    uvm_config_db#(uvma_simple_mem_cntxt)::set(this, "instr_mem_agent*", "cntxt", cntxt.instr_mem_cntxt);
    uvm_config_db#(uvma_simple_mem_cntxt)::set(this, "data_mem_agent*",  "cntxt", cntxt.data_mem_cntxt );
    uvm_config_db#(uvma_interrupt_cntxt )::set(this, "interrupt_agent*", "cntxt", cntxt.interrupt_cntxt);
    uvm_config_db#(uvma_rvfi_cntxt      )::set(this, "rvfi_agent*",      "cntxt", cntxt.rvfi_cntxt     );
    uvm_config_db#(uvma_isacov_cntxt    )::set(this, "isacov_agent*",    "cntxt", cntxt.isacov_cntxt   );
  endfunction : assign_cntxt

  function void create_agents();
    clk_rst_agent   = uvma_clk_rst_agent   ::type_id::create("clk_rst_agent",   this);
    instr_mem_agent = uvma_simple_mem_agent::type_id::create("instr_mem_agent", this);
    data_mem_agent  = uvma_simple_mem_agent::type_id::create("data_mem_agent",  this);
    rvfi_agent      = uvma_rvfi_agent      ::type_id::create("rvfi_agent",      this);
    isacov_agent    = uvma_isacov_agent    ::type_id::create("isacov_agent",    this);
    interrupt_agent = uvma_interrupt_agent ::type_id::create("interrupt_agent", this);
  endfunction : create_agents

  function void create_components();
    scoreboard      = ibex_core_scoreboard ::type_id::create("scoreboard",      this);
    vsqr            = ibex_core_vsqr       ::type_id::create("vsqr",            this);
  endfunction : create_components

  function void connect_vsqr();
    vsqr.clk_rst_sqr   = clk_rst_agent.sequencer;
    vsqr.instr_mem_sqr = instr_mem_agent.sequencer;
    vsqr.data_mem_sqr  = data_mem_agent.sequencer;
    vsqr.interrupt_sqr = interrupt_agent.sequencer;
  endfunction : connect_vsqr

endclass : ibex_core_env

`endif // __IBEX_CORE_ENV_SV__
