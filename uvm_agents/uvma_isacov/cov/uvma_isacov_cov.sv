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
    rv32i_opcodes_cg = new();
    rv32_seq_cg      = new();

    if (cfg.ext_i_supported) begin
      rv32i_add_cg  = new("rv32i_add_cg");
      rv32i_sub_cg  = new("rv32i_sub_cg");
      rv32i_and_cg  = new("rv32i_and_cg");
      rv32i_or_cg   = new("rv32i_or_cg");
      rv32i_xor_cg  = new("rv32i_xor_cg");
      
      rv32i_slt_cg  = new("rv32i_slt_cg");
      rv32i_sltu_cg = new("rv32i_sltu_cg");
      
      rv32i_sll_cg  = new("rv32i_sll_cg");
      rv32i_srl_cg  = new("rv32i_srl_cg");
      rv32i_sra_cg  = new("rv32i_sra_cg");

      rv32i_addi_cg = new("rv32i_addi_cg");
      rv32i_andi_cg = new("rv32i_andi_cg");
      rv32i_ori_cg  = new("rv32i_ori_cg");
      rv32i_xori_cg = new("rv32i_xori_cg");
      rv32i_jalr_cg = new("rv32i_jalr_cg");
      
      rv32i_slti_cg  = new("rv32i_slti_cg");
      rv32i_sltiu_cg = new("rv32i_sltiu_cg");
      rv32i_slli_cg  = new("rv32i_slli_cg");
      rv32i_srli_cg  = new("rv32i_srli_cg");
      rv32i_srai_cg  = new("rv32i_srai_cg");

      rv32i_lb_cg  = new("rv32i_lb_cg");
      rv32i_lh_cg  = new("rv32i_lh_cg");
      rv32i_lw_cg  = new("rv32i_lw_cg");
      rv32i_lbu_cg = new("rv32i_lbu_cg");
      rv32i_lhu_cg = new("rv32i_lhu_cg");

      rv32i_sb_cg = new("rv32i_sb_cg");
      rv32i_sh_cg = new("rv32i_sh_cg");
      rv32i_sw_cg = new("rv32i_sw_cg");

      rv32i_beq_cg  = new("rv32i_beq_cg");
      rv32i_bne_cg  = new("rv32i_bne_cg");
      rv32i_blt_cg  = new("rv32i_blt_cg");
      rv32i_bge_cg  = new("rv32i_bge_cg");
      rv32i_bltu_cg = new("rv32i_bltu_cg");
      rv32i_bgeu_cg = new("rv32i_bgeu_cg");

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
      rv32m_mul_cg    = new("rv32m_mul_cg");
      rv32m_mulh_cg   = new("rv32m_mulh_cg");
      rv32m_mulhsu_cg = new("rv32m_mulhsu_cg");
      rv32m_mulhu_cg  = new("rv32m_mulhu_cg");
      
      rv32m_div_cg    = new("rv32m_div_cg");
      rv32m_divu_cg   = new("rv32m_divu_cg");
      rv32m_rem_cg    = new("rv32m_rem_cg");
      rv32m_remu_cg   = new("rv32m_remu_cg");

      rv32m_div_results_cg  = new("rv32m_div_results_cg");
      rv32m_divu_results_cg = new("rv32m_divu_results_cg");
      rv32m_rem_results_cg  = new("rv32m_rem_results_cg");
      rv32m_remu_results_cg = new("rv32m_remu_results_cg");
    end

    if (cfg.ext_zicsr_supported) begin
      rv32zicsr_csrrw_cg  = new("rv32zicsr_csrrw_cg");
      rv32zicsr_csrrs_cg  = new("rv32zicsr_csrrs_cg");
      rv32zicsr_csrrc_cg  = new("rv32zicsr_csrrc_cg");
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
    bit is_rd_rs1_hazard;
    bit is_rd_rs2_hazard;
    bit is_rs1_hazard;
    bit is_rs2_hazard;
    bit is_taken;
    bit dir_back;

    if (!cfg.enabled || !cfg.cov_model_enabled) return;
    
    instr = t.instr;

    // Ignore illegal instructions (decode errors are not covered)
    if (instr.illegal || instr.name == UNKNOWN_INSTR) return;

    // Evaluate hazards cleanly
    is_rd_rs1_hazard = 0;
    is_rd_rs2_hazard = 0;
    is_rs1_hazard = 0;
    is_rs2_hazard = 0;

    if (cfg.reg_hazards_enabled) begin
      is_rd_rs1_hazard = (instr.rd == instr.rs1);
      is_rd_rs2_hazard = (instr.rd == instr.rs2);
      if (instr_prev != null) begin
        if (instr.rs1_valid && instr_prev.rd_valid && (instr.rs1 == instr_prev.rd))
          is_rs1_hazard = 1;
        if (instr.rs2_valid && instr_prev.rd_valid && (instr.rs2 == instr_prev.rd))
          is_rs2_hazard = 1;
      end
    end

    is_taken = instr.is_branch_taken();
    dir_back = instr.immb[31];

    // 1. Stamp the global opcode dashboard
    rv32i_opcodes_cg.sample(instr.name);

    // 2. Evaluate sequential hazards when history exists
    if (instr_prev != null && cfg.reg_hazards_enabled) begin
      rv32_seq_cg.sample(instr.rs1, instr.rs2, is_rs1_hazard, is_rs2_hazard);
    end

    // 3. Route to opcode-specific coverage template
    case (instr.name)
      // RV32I Base
      ADD:   rv32i_add_cg.sample(instr.rs1, instr.rs2, instr.rd, instr.rs1_value, instr.rs2_value, instr.rd_value, is_rd_rs1_hazard, is_rd_rs2_hazard);
      SUB:   rv32i_sub_cg.sample(instr.rs1, instr.rs2, instr.rd, instr.rs1_value, instr.rs2_value, instr.rd_value, is_rd_rs1_hazard, is_rd_rs2_hazard);
      AND:   rv32i_and_cg.sample(instr.rs1, instr.rs2, instr.rd, instr.rs1_value, instr.rs2_value, instr.rd_value, is_rd_rs1_hazard, is_rd_rs2_hazard);
      OR:    rv32i_or_cg.sample(instr.rs1, instr.rs2, instr.rd, instr.rs1_value, instr.rs2_value, instr.rd_value, is_rd_rs1_hazard, is_rd_rs2_hazard);
      XOR:   rv32i_xor_cg.sample(instr.rs1, instr.rs2, instr.rd, instr.rs1_value, instr.rs2_value, instr.rd_value, is_rd_rs1_hazard, is_rd_rs2_hazard);
      SLT:   rv32i_slt_cg.sample(instr.rs1, instr.rs2, instr.rd_value[0]);
      SLTU:  rv32i_sltu_cg.sample(instr.rs1, instr.rs2, instr.rd_value[0]);
      SLL:   rv32i_sll_cg.sample(instr.rs1, instr.rd, instr.rs2_value[4:0]);
      SRL:   rv32i_srl_cg.sample(instr.rs1, instr.rd, instr.rs2_value[4:0]);
      SRA:   rv32i_sra_cg.sample(instr.rs1, instr.rd, instr.rs2_value[4:0]);

      ADDI:  rv32i_addi_cg.sample(instr.rs1, instr.rd, instr.immi[11:0], is_rd_rs1_hazard);
      ANDI:  rv32i_andi_cg.sample(instr.rs1, instr.rd, instr.immi[11:0], is_rd_rs1_hazard);
      ORI:   rv32i_ori_cg.sample(instr.rs1, instr.rd, instr.immi[11:0], is_rd_rs1_hazard);
      XORI:  rv32i_xori_cg.sample(instr.rs1, instr.rd, instr.immi[11:0], is_rd_rs1_hazard);
      SLTI:  rv32i_slti_cg.sample(instr.rs1, instr.rd_value[0]);
      SLTIU: rv32i_sltiu_cg.sample(instr.rs1, instr.rd_value[0]);
      SLLI:  rv32i_slli_cg.sample(instr.rs1, instr.rd, instr.immi[4:0]);
      SRLI:  rv32i_srli_cg.sample(instr.rs1, instr.rd, instr.immi[4:0]);
      SRAI:  rv32i_srai_cg.sample(instr.rs1, instr.rd, instr.immi[4:0]);
      JALR:  rv32i_jalr_cg.sample(instr.rs1, instr.rd, instr.immi[11:0], is_rd_rs1_hazard);

      LB:    rv32i_lb_cg.sample(instr.rs1, instr.rd, instr.immi[11:0], is_rd_rs1_hazard);
      LH:    rv32i_lh_cg.sample(instr.rs1, instr.rd, instr.immi[11:0], is_rd_rs1_hazard);
      LW:    rv32i_lw_cg.sample(instr.rs1, instr.rd, instr.immi[11:0], is_rd_rs1_hazard);
      LBU:   rv32i_lbu_cg.sample(instr.rs1, instr.rd, instr.immi[11:0], is_rd_rs1_hazard);
      LHU:   rv32i_lhu_cg.sample(instr.rs1, instr.rd, instr.immi[11:0], is_rd_rs1_hazard);

      SB:    rv32i_sb_cg.sample(instr.rs1, instr.rs2, instr.imms[11:0]);
      SH:    rv32i_sh_cg.sample(instr.rs1, instr.rs2, instr.imms[11:0]);
      SW:    rv32i_sw_cg.sample(instr.rs1, instr.rs2, instr.imms[11:0]);

      BEQ:   rv32i_beq_cg.sample(instr.rs1, instr.rs2, is_taken, dir_back);
      BNE:   rv32i_bne_cg.sample(instr.rs1, instr.rs2, is_taken, dir_back);
      BLT:   rv32i_blt_cg.sample(instr.rs1, instr.rs2, is_taken, dir_back);
      BGE:   rv32i_bge_cg.sample(instr.rs1, instr.rs2, is_taken, dir_back);
      BLTU:  rv32i_bltu_cg.sample(instr.rs1, instr.rs2, is_taken, dir_back);
      BGEU:  rv32i_bgeu_cg.sample(instr.rs1, instr.rs2, is_taken, dir_back);

      LUI:   rv32i_lui_cg.sample(instr.rd, instr.immu);
      AUIPC: rv32i_auipc_cg.sample(instr.rd, instr.immu);
      JAL:   rv32i_jal_cg.sample(instr.rd, dir_back);

      ECALL:  rv32i_ecall_cg.sample(instr.name);
      EBREAK: rv32i_ebreak_cg.sample(instr.name);
      MRET:   rv32i_mret_cg.sample(instr.name);
      WFI:    rv32i_wfi_cg.sample(instr.name);
      
      // RV32M
      MUL:    rv32m_mul_cg.sample(instr.rs1, instr.rs2, instr.rd, instr.rs1_value, instr.rs2_value, instr.rd_value, is_rd_rs1_hazard, is_rd_rs2_hazard);
      MULH:   rv32m_mulh_cg.sample(instr.rs1, instr.rs2, instr.rd, instr.rs1_value, instr.rs2_value, instr.rd_value, is_rd_rs1_hazard, is_rd_rs2_hazard);
      MULHSU: rv32m_mulhsu_cg.sample(instr.rs1, instr.rs2, instr.rd, instr.rs1_value, instr.rs2_value, instr.rd_value, is_rd_rs1_hazard, is_rd_rs2_hazard);
      MULHU:  rv32m_mulhu_cg.sample(instr.rs1, instr.rs2, instr.rd, instr.rs1_value, instr.rs2_value, instr.rd_value, is_rd_rs1_hazard, is_rd_rs2_hazard);
      
      DIV:    begin rv32m_div_cg.sample(instr.rs1, instr.rs2, instr.rd, instr.rs1_value, instr.rs2_value, instr.rd_value, is_rd_rs1_hazard, is_rd_rs2_hazard);  rv32m_div_results_cg.sample(instr.rs1_value, instr.rs2_value);  end
      DIVU:   begin rv32m_divu_cg.sample(instr.rs1, instr.rs2, instr.rd, instr.rs1_value, instr.rs2_value, instr.rd_value, is_rd_rs1_hazard, is_rd_rs2_hazard); rv32m_divu_results_cg.sample(instr.rs1_value, instr.rs2_value); end
      REM:    begin rv32m_rem_cg.sample(instr.rs1, instr.rs2, instr.rd, instr.rs1_value, instr.rs2_value, instr.rd_value, is_rd_rs1_hazard, is_rd_rs2_hazard);  rv32m_rem_results_cg.sample(instr.rs1_value, instr.rs2_value);  end
      REMU:   begin rv32m_remu_cg.sample(instr.rs1, instr.rs2, instr.rd, instr.rs1_value, instr.rs2_value, instr.rd_value, is_rd_rs1_hazard, is_rd_rs2_hazard); rv32m_remu_results_cg.sample(instr.rs1_value, instr.rs2_value); end

      // Zicsr & Zifencei
      CSRRW:  rv32zicsr_csrrw_cg.sample(instr.rs1, instr.rd, instr.csr_val);
      CSRRS:  rv32zicsr_csrrs_cg.sample(instr.rs1, instr.rd, instr.csr_val);
      CSRRC:  rv32zicsr_csrrc_cg.sample(instr.rs1, instr.rd, instr.csr_val);
      CSRRWI: rv32zicsr_csrrwi_cg.sample(instr.rd, instr.rs1, instr.csr_val);
      CSRRSI: rv32zicsr_csrrsi_cg.sample(instr.rd, instr.rs1, instr.csr_val);
      CSRRCI: rv32zicsr_csrrci_cg.sample(instr.rd, instr.rs1, instr.csr_val);
      FENCE_I: rv32zifencei_fence_i_cg.sample(instr.name);

      default: ; // Instructions silently ignored when unmapped
    endcase

    // 4. Save current state for next round (pipeline history)
    instr_prev = instr;

  endfunction

endclass : uvma_isacov_cov

`endif // __UVMA_ISACOV_COV_SV__
