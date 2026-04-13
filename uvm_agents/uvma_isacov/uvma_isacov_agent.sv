`ifndef __UVMA_ISACOV_AGENT_SV__
`define __UVMA_ISACOV_AGENT_SV__
  
class uvma_isacov_agent extends uvm_agent;

  uvma_isacov_cfg   cfg;
  uvma_isacov_cntxt cntxt;
  uvma_isacov_mon   monitor;
  uvma_isacov_cov   cov_model;

  uvm_analysis_export #(uvma_rvfi_seq_item) rvfi_export;

  `uvm_component_utils_begin(uvma_isacov_agent)
    `uvm_field_object(cfg,   UVM_DEFAULT)
    `uvm_field_object(cntxt, UVM_DEFAULT)
  `uvm_component_utils_end

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    if(!uvm_config_db#(uvma_isacov_cfg)::get(this, "", "cfg", cfg))
      `uvm_fatal("CFG", "Configuration object not found for ISACOV Agent")

    if(!uvm_config_db#(uvma_isacov_cntxt)::get(this, "", "cntxt", cntxt)) begin
      cntxt = uvma_isacov_cntxt::type_id::create("cntxt");
      uvm_config_db#(uvma_isacov_cntxt)::set(this, "*", "cntxt", cntxt);
    end

    rvfi_export = new("rvfi_export", this);
    if (cfg.enabled) begin
      monitor   = uvma_isacov_mon::type_id::create("monitor", this);
      if (cfg.cov_model_enabled) begin
        cov_model = uvma_isacov_cov::type_id::create("cov_model", this);
      end
    end
  endfunction

  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    if (cfg.enabled) begin
      rvfi_export.connect(monitor.rvfi_instr_imp);
      if (cfg.cov_model_enabled) begin
        monitor.ap.connect(cov_model.analysis_export);
      end
    end
  endfunction

endclass : uvma_isacov_agent

`endif // __UVMA_ISACOV_AGENT_SV__
