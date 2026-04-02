`ifndef __UVMA_ISACOV_COV_SV__
`define __UVMA_ISACOV_COV_SV__

class uvma_isacov_cov extends uvm_component;

  `uvm_component_utils(uvma_isacov_cov)

  uvma_isacov_cfg   cfg;
  uvma_isacov_instr instr_prev;

  uvm_analysis_imp #(uvma_isacov_mon_trn, uvma_isacov_cov) analysis_export;

  cg_instr_names         rv32i_opcodes_cg; // Main dashboard

  // RV32I
  cg_rtype               rv32i_add_cg, rv32i_sub_cg, rv32i_or_cg, rv32i_and_cg, rv32i_xor_cg;
  cg_rtype_slt           rv32i_slt_cg, rv32i_sltu_cg;
  cg_rtype_shift         rv32i_sll_cg, rv32i_srl_cg, rv32i_sra_cg;
  
  cg_itype               rv32i_addi_cg, rv32i_xori_cg, rv32i_ori_cg, rv32i_andi_cg, rv32i_jalr_cg;
  cg_itype_slt           rv32i_slti_cg, rv32i_sltiu_cg;
  cg_itype_shift         rv32i_slli_cg, rv32i_srli_cg, rv32i_srai_cg;
  
  cg_itype_load          rv32i_lb_cg, rv32i_lh_cg, rv32i_lw_cg, rv32i_lbu_cg, rv32i_lhu_cg;
  cg_stype               rv32i_sb_cg, rv32i_sh_cg, rv32i_sw_cg;
  cg_btype               rv32i_beq_cg, rv32i_bne_cg, rv32i_blt_cg, rv32i_bge_cg, rv32i_bltu_cg, rv32i_bgeu_cg;
  cg_utype               rv32i_lui_cg, rv32i_auipc_cg;
  cg_jtype               rv32i_jal_cg;

  // RV32M
  cg_rtype               rv32m_mul_cg, rv32m_mulh_cg, rv32m_mulhsu_cg, rv32m_mulhu_cg;
  cg_rtype               rv32m_div_cg, rv32m_divu_cg, rv32m_rem_cg, rv32m_remu_cg;
  cg_div_special_results rv32m_div_results_cg, rv32m_divu_results_cg;
  cg_div_special_results rv32m_rem_results_cg, rv32m_remu_results_cg;

  // System & CSR
  cg_executed_type       rv32i_fence_cg, rv32i_wfi_cg, rv32i_mret_cg, rv32i_ecall_cg, rv32i_ebreak_cg;
  cg_executed_type       rv32zifencei_fence_i_cg;
  cg_csrtype             rv32zicsr_csrrw_cg, rv32zicsr_csrrs_cg, rv32zicsr_csrrc_cg;
  cg_csritype            rv32zicsr_csrrwi_cg, rv32zicsr_csrrsi_cg, rv32zicsr_csrrci_cg;

  // Sequential (hazards)
  cg_sequential          rv32_seq_cg;

  function new(string name, uvm_component parent);
    super.new(name, parent);
    analysis_export = new("analysis_export", this);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    // Fetch configuration to know what to enable/disable
    if (!uvm_config_db#(uvma_isacov_cfg)::get(this, "", "cfg", cfg)) begin
      `uvm_fatal("COV_MODEL", "Configuration not found in uvm_config_db!")
    end

    // Build covergroup set only when model is enabled
    if (cfg.cov_model_enabled && cfg.enabled) begin
      build_covergroups();
    end
  endfunction
  
  function void build_covergroups();
    bit cr = cfg.reg_crosses_enabled;
    bit hz = cfg.reg_hazards_enabled;

    rv32i_opcodes_cg = new();
    rv32_seq_cg      = new(hz);

    if (cfg.ext_i_supported) begin
      rv32i_add_cg  = new("rv32i_add_cg", cr, hz);
      rv32i_sub_cg  = new("rv32i_sub_cg", cr, hz);
      rv32i_and_cg  = new("rv32i_and_cg", cr, hz);
      rv32i_or_cg   = new("rv32i_or_cg",  cr, hz);
      rv32i_xor_cg  = new("rv32i_xor_cg", cr, hz);
      
      rv32i_slt_cg  = new("rv32i_slt_cg", cr, hz);
      rv32i_sltu_cg = new("rv32i_sltu_cg", cr, hz);
      
      rv32i_sll_cg  = new("rv32i_sll_cg", cr, hz);
      rv32i_srl_cg  = new("rv32i_srl_cg", cr, hz);
      rv32i_sra_cg  = new("rv32i_sra_cg", cr, hz);

      rv32i_addi_cg = new("rv32i_addi_cg", cr, hz);
      rv32i_andi_cg = new("rv32i_andi_cg", cr, hz);
      rv32i_ori_cg  = new("rv32i_ori_cg",  cr, hz);
      rv32i_xori_cg = new("rv32i_xori_cg", cr, hz);
      rv32i_jalr_cg = new("rv32i_jalr_cg", cr, hz);
      
      rv32i_slti_cg  = new("rv32i_slti_cg", cr, hz);
      rv32i_sltiu_cg = new("rv32i_sltiu_cg", cr, hz);
      rv32i_slli_cg  = new("rv32i_slli_cg", cr, hz);
      rv32i_srli_cg  = new("rv32i_srli_cg", cr, hz);
      rv32i_srai_cg  = new("rv32i_srai_cg", cr, hz);

      rv32i_lb_cg  = new("rv32i_lb_cg", cr, hz);
      rv32i_lh_cg  = new("rv32i_lh_cg", cr, hz);
      rv32i_lw_cg  = new("rv32i_lw_cg", cr, hz);
      rv32i_lbu_cg = new("rv32i_lbu_cg", cr, hz);
      rv32i_lhu_cg = new("rv32i_lhu_cg", cr, hz);

      rv32i_sb_cg = new("rv32i_sb_cg", cr);
      rv32i_sh_cg = new("rv32i_sh_cg", cr);
      rv32i_sw_cg = new("rv32i_sw_cg", cr);

      rv32i_beq_cg  = new("rv32i_beq_cg", cr);
      rv32i_bne_cg  = new("rv32i_bne_cg", cr);
      rv32i_blt_cg  = new("rv32i_blt_cg", cr);
      rv32i_bge_cg  = new("rv32i_bge_cg", cr);
      rv32i_bltu_cg = new("rv32i_bltu_cg", cr);
      rv32i_bgeu_cg = new("rv32i_bgeu_cg", cr);

      rv32i_lui_cg   = new("rv32i_lui_cg");
      rv32i_auipc_cg = new("rv32i_auipc_cg");
      rv32i_jal_cg   = new("rv32i_jal_cg");

      rv32i_fence_cg  = new("rv32i_fence_cg", FENCE);
      rv32i_wfi_cg    = new("rv32i_wfi_cg", WFI);
      rv32i_mret_cg   = new("rv32i_mret_cg", MRET);
      rv32i_ecall_cg  = new("rv32i_ecall_cg", ECALL);
      rv32i_ebreak_cg = new("rv32i_ebreak_cg", EBREAK);
    end

    if (cfg.ext_m_supported) begin
      rv32m_mul_cg    = new("rv32m_mul_cg", cr, hz);
      rv32m_mulh_cg   = new("rv32m_mulh_cg", cr, hz);
      rv32m_mulhsu_cg = new("rv32m_mulhsu_cg", cr, hz);
      rv32m_mulhu_cg  = new("rv32m_mulhu_cg", cr, hz);
      
      rv32m_div_cg    = new("rv32m_div_cg", cr, hz);
      rv32m_divu_cg   = new("rv32m_divu_cg", cr, hz);
      rv32m_rem_cg    = new("rv32m_rem_cg", cr, hz);
      rv32m_remu_cg   = new("rv32m_remu_cg", cr, hz);

      rv32m_div_results_cg  = new("rv32m_div_results_cg");
      rv32m_divu_results_cg = new("rv32m_divu_results_cg");
      rv32m_rem_results_cg  = new("rv32m_rem_results_cg");
      rv32m_remu_results_cg = new("rv32m_remu_results_cg");
    end

    if (cfg.ext_zicsr_supported) begin
      rv32zicsr_csrrw_cg  = new("rv32zicsr_csrrw_cg", cr);
      rv32zicsr_csrrs_cg  = new("rv32zicsr_csrrs_cg", cr);
      rv32zicsr_csrrc_cg  = new("rv32zicsr_csrrc_cg", cr);
      rv32zicsr_csrrwi_cg = new("rv32zicsr_csrrwi_cg");
      rv32zicsr_csrrsi_cg = new("rv32zicsr_csrrsi_cg");
      rv32zicsr_csrrci_cg = new("rv32zicsr_csrrci_cg");
    end

    if (cfg.ext_zifencei_supported) begin
      rv32zifencei_fence_i_cg = new("rv32zifencei_fence_i_cg", FENCE_I);
    end
  endfunction

  virtual function void write(uvma_isacov_mon_trn t);
    uvma_isacov_instr instr;

    if (!cfg.enabled || !cfg.cov_model_enabled) return;
    
    instr = t.instr;

    // Ignore illegal instructions (decode errors are not covered)
    if (instr.illegal || instr.name == UNKNOWN_INSTR) return;

    // 1. Stamp the global opcode dashboard
    rv32i_opcodes_cg.sample(instr);

    // 2. Evaluate sequential hazards when history exists
    if (instr_prev != null) begin
      rv32_seq_cg.sample(instr, instr_prev);
    end

    // 3. Route to opcode-specific coverage template
    case (instr.name)
      // RV32I Base
      ADD:   rv32i_add_cg.sample(instr);
      SUB:   rv32i_sub_cg.sample(instr);
      AND:   rv32i_and_cg.sample(instr);
      OR:    rv32i_or_cg.sample(instr);
      XOR:   rv32i_xor_cg.sample(instr);
      SLT:   rv32i_slt_cg.sample(instr);
      SLTU:  rv32i_sltu_cg.sample(instr);
      SLL:   rv32i_sll_cg.sample(instr);
      SRL:   rv32i_srl_cg.sample(instr);
      SRA:   rv32i_sra_cg.sample(instr);

      ADDI:  rv32i_addi_cg.sample(instr);
      ANDI:  rv32i_andi_cg.sample(instr);
      ORI:   rv32i_ori_cg.sample(instr);
      XORI:  rv32i_xori_cg.sample(instr);
      SLTI:  rv32i_slti_cg.sample(instr);
      SLTIU: rv32i_sltiu_cg.sample(instr);
      SLLI:  rv32i_slli_cg.sample(instr);
      SRLI:  rv32i_srli_cg.sample(instr);
      SRAI:  rv32i_srai_cg.sample(instr);
      JALR:  rv32i_jalr_cg.sample(instr);

      LB:    rv32i_lb_cg.sample(instr);
      LH:    rv32i_lh_cg.sample(instr);
      LW:    rv32i_lw_cg.sample(instr);
      LBU:   rv32i_lbu_cg.sample(instr);
      LHU:   rv32i_lhu_cg.sample(instr);

      SB:    rv32i_sb_cg.sample(instr);
      SH:    rv32i_sh_cg.sample(instr);
      SW:    rv32i_sw_cg.sample(instr);

      BEQ:   rv32i_beq_cg.sample(instr);
      BNE:   rv32i_bne_cg.sample(instr);
      BLT:   rv32i_blt_cg.sample(instr);
      BGE:   rv32i_bge_cg.sample(instr);
      BLTU:  rv32i_bltu_cg.sample(instr);
      BGEU:  rv32i_bgeu_cg.sample(instr);

      LUI:   rv32i_lui_cg.sample(instr);
      AUIPC: rv32i_auipc_cg.sample(instr);
      JAL:   rv32i_jal_cg.sample(instr);

      ECALL:  rv32i_ecall_cg.sample(instr);
      EBREAK: rv32i_ebreak_cg.sample(instr);
      MRET:   rv32i_mret_cg.sample(instr);
      WFI:    rv32i_wfi_cg.sample(instr);
      
      // RV32M
      MUL:    rv32m_mul_cg.sample(instr);
      MULH:   rv32m_mulh_cg.sample(instr);
      MULHSU: rv32m_mulhsu_cg.sample(instr);
      MULHU:  rv32m_mulhu_cg.sample(instr);
      
      DIV:    begin rv32m_div_cg.sample(instr);  rv32m_div_results_cg.sample(instr);  end
      DIVU:   begin rv32m_divu_cg.sample(instr); rv32m_divu_results_cg.sample(instr); end
      REM:    begin rv32m_rem_cg.sample(instr);  rv32m_rem_results_cg.sample(instr);  end
      REMU:   begin rv32m_remu_cg.sample(instr); rv32m_remu_results_cg.sample(instr); end

      // Zicsr & Zifencei
      CSRRW:  rv32zicsr_csrrw_cg.sample(instr);
      CSRRS:  rv32zicsr_csrrs_cg.sample(instr);
      CSRRC:  rv32zicsr_csrrc_cg.sample(instr);
      CSRRWI: rv32zicsr_csrrwi_cg.sample(instr);
      CSRRSI: rv32zicsr_csrrsi_cg.sample(instr);
      CSRRCI: rv32zicsr_csrrci_cg.sample(instr);
      FENCE_I: rv32zifencei_fence_i_cg.sample(instr);

      default: ; // Instructions silently ignored when unmapped
    endcase

    // 4. Save current state for next round (pipeline history)
    instr_prev = instr;

  endfunction

endclass : uvma_isacov_cov

`endif // __UVMA_ISACOV_COV_SV__
