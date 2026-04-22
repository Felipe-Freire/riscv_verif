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

  // Cosim handle
  chandle spike_handle;

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

    init_cosim();

    assign_cfg  ();
    assign_cntxt();
    assign_cosim_handle();

    create_agents    ();
    create_components();

    `uvm_info("IBEX_CORE_ENV", "Environment Ibex built successfully.", UVM_LOW)
  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    rvfi_agent.ap.connect(scoreboard.rvfi_export);
    rvfi_agent.ap.connect(isacov_agent.rvfi_export);
    data_mem_agent.ap.connect(scoreboard.dmem_export);
    connect_vsqr();
    interrupt_agent.ap.connect(scoreboard.interrupt_export);
  endfunction

  function void start_of_simulation_phase(uvm_phase phase);
    reg [7:0] mem_copy [bit[32-1:0]];
    string hex_file_path;

    super.start_of_simulation_phase(phase);

    if (!$value$plusargs("HEX_FILE=%s", hex_file_path)) begin
      `uvm_fatal("ENV", "Path to HEX file not provided! Use +HEX_FILE=path/to/file.hex")
    end
    
    cntxt.shared_mem.load_hex(hex_file_path);

    if (spike_handle == null) begin
      `uvm_fatal("ENV", "spike_handle is null! Cannot load memory into Spike.")
    end

    cntxt.shared_mem.get_backdoor_memory(mem_copy);

    foreach (mem_copy[addr]) begin
      riscv_cosim_write_mem_byte(spike_handle, addr, mem_copy[addr]);
    end

    `uvm_info("ENV", "Instruction memory loaded and synchronized with co-simulation model.", UVM_LOW)
  endfunction

  function void report_phase(uvm_phase phase);
    super.report_phase(phase);

    if (uvm_config_db#(chandle)::get(this, "", "spike_handle", spike_handle)) begin
      spike_cosim_release(spike_handle);
      `uvm_info("BASE_TEST", "Spike co-simulation model released.", UVM_LOW)
    end
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

  function void assign_cosim_handle();
    uvm_config_db#(chandle)::set(this, "*", "spike_handle", spike_handle);
  endfunction : assign_cosim_handle

  function void init_cosim();
    spike_handle = spike_cosim_init(
      cfg.isa_string,     // isa_string
      cfg.start_pc, // start_pc (Boot address)
      cfg.start_mtvec, // start_mtvec (Padrão)
      cfg.log_file,   // log_file_path (Ou "" se não quiser gerar log em arquivo)
      cfg.pmp_num_regions,             // pmp_num_regions (De acordo com seu RTL)
      cfg.pmp_granularity,             // pmp_granularity (De acordo com seu RTL)
      cfg.mhpm_counter_num,            // mhpm_counter_num (De acordo com seu RTL)
      cfg.secure_ibex,                 // secure_ibex (1'b0 no seu RTL)
      cfg.icache,                      // icache (1'b0 no seu RTL)
      cfg.dm_start_addr,               // dm_start_addr (DmBaseAddr do RTL)
      cfg.dm_end_addr                  // dm_end_addr (DmExceptionAddr do RTL)
    );

    if (spike_handle == null) begin
      `uvm_fatal("COSIM", "Failed to initialize the Spike C++ co-simulation model")
    end
  endfunction : init_cosim
endclass : ibex_core_env

`endif // __IBEX_CORE_ENV_SV__
