`ifndef __UVMA_ISACOV_MON_SV__
`define __UVMA_ISACOV_MON_SV__

`uvm_analysis_imp_decl(_rvfi_instr)

class uvma_isacov_mon extends uvm_monitor;

  `uvm_component_utils(uvma_isacov_mon)

  uvma_isacov_cfg   cfg;
  uvma_isacov_cntxt cntxt;

  uvm_analysis_port #(uvma_isacov_mon_trn) ap;

  uvm_analysis_imp_rvfi_instr #(uvma_rvfi_seq_item, uvma_isacov_mon) rvfi_instr_imp;

  function new(string name, uvm_component parent=null);
    super.new(name, parent);
    rvfi_instr_imp = new("rvfi_instr_imp", this);
    ap = new("ap", this);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    if (!uvm_config_db#(uvma_isacov_cntxt)::get(this, "", "cntxt", cntxt)) begin
      `uvm_fatal("CNTXT", "Context handle is null")
    end

    if (!uvm_config_db#(uvma_isacov_cfg)::get(this, "", "cfg", cfg)) begin
      `uvm_fatal("CFG", "Configuration handle is null")
    end
  endfunction

  // Callback function triggered by RVFI
  virtual function void write_rvfi_instr(uvma_rvfi_seq_item rvfi_instr);
    uvma_isacov_mon_trn mon_trn;

    if (!cfg.enabled) return;
    
    // Ignore bubble instructions (where nothing executed)
    if (rvfi_instr.trap || (rvfi_instr.pc_rdata == 0 && rvfi_instr.insn == 0)) return;

    // Instantiate envelope and instruction
    mon_trn = uvma_isacov_mon_trn::type_id::create("mon_trn");
    mon_trn.instr = uvma_isacov_instr#(DEFAULT_ILEN, DEFAULT_XLEN)::type_id::create("mon_instr");
    
    // Attach original transaction
    mon_trn.instr.rvfi = rvfi_instr;

    mon_trn.instr.decode();

    // ----------------------------------------------------------------------
    // Supported extension validation
    // ----------------------------------------------------------------------
    // Check if decoded instruction belongs to an extension that is
    // DISABLED in agent configuration.
    if ((mon_trn.instr.ext == M_EXT && !cfg.ext_m_supported) ||
        (mon_trn.instr.ext == C_EXT && !cfg.ext_c_supported) ||
        (mon_trn.instr.ext == ZICSR_EXT && !cfg.ext_zicsr_supported)) begin
      mon_trn.instr.illegal = 1;
    end

    // If SystemVerilog decoder did not find instruction in switch-case
    if (mon_trn.instr.name == UNKNOWN_INSTR) begin
      mon_trn.instr.illegal = 1;
    end

    // ----------------------------------------------------------------------
    // Statistics update (context)
    // ----------------------------------------------------------------------
    cntxt.num_instr_sampled++;
    if (mon_trn.instr.illegal) begin
      cntxt.num_illegal_sampled++;
    end else begin
      `uvm_info("ISACOVMON", $sformatf("rvfi = 0x%08x Decoded: %s (Type: %s)", 
                rvfi_instr.insn, mon_trn.instr.name.name(), mon_trn.instr.itype.name()), UVM_HIGH)
    end

    // Send processed envelope to analysis port (toward coverage model)
    ap.write(mon_trn);
  endfunction

endclass : uvma_isacov_mon

`endif // __UVMA_ISACOV_MON_SV__
