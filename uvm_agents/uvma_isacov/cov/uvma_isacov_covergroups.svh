// ============================================================================
// FILE: uvma_isacov_covergroups.svh
// DESCRIPTION: Mathematical definitions for covergroups (templates).
// ATTENTION: This file does not contain a class (class/endclass). It is meant
// to be inserted (via `include) directly INSIDE the cov_model class.
// ============================================================================

// ----------------------------------------------------------------------------
// 1. SCENARIO A: GLOBAL OPCODE DASHBOARD (Main album)
// ----------------------------------------------------------------------------
covergroup cg_instr_names with function sample(uvma_isacov_instr instr);
  option.per_instance = 1;
  option.name = "cg_instr_names_dashboard";

  // Ensure all instructions supported by the core were seen
  cp_opcode: coverpoint instr.name {
    // Ignore unknown or illegal instructions in success dashboard
    ignore_bins ign = {UNKNOWN_INSTR};
  }
endgroup : cg_instr_names


// ----------------------------------------------------------------------------
// 2. SCENARIOS B and C: R-TYPE (ADD, SUB, AND, OR, XOR, MUL, DIV)
// ----------------------------------------------------------------------------
covergroup cg_rtype(
  string cg_name, 
  bit reg_crosses_enabled,
  bit reg_hazards_enabled
) with function sample(uvma_isacov_instr instr);
  
  option.per_instance = 1;
  option.name = cg_name;

  // --- Basic register coverage ---
  cp_rs1: coverpoint instr.rs1 { bins regs[] = {[0:31]}; }
  cp_rs2: coverpoint instr.rs2 { bins regs[] = {[0:31]}; }
  cp_rd:  coverpoint instr.rd  { bins regs[] = {[0:31]}; }

  // --- Intra-instruction hazards (e.g., ADD x5, x5, x2) ---
  cp_rd_rs1_hazard: coverpoint instr.rd {
    ignore_bins IGN_OFF = {[0:$]} with (!reg_hazards_enabled);
    bins HAZARD[] = {[0:31]} iff (instr.rd == instr.rs1);
  }
  cp_rd_rs2_hazard: coverpoint instr.rd {
    ignore_bins IGN_OFF = {[0:$]} with (!reg_hazards_enabled);
    bins HAZARD[] = {[0:31]} iff (instr.rd == instr.rs2);
  }

  // --- Combinatorial explosion: all ALU ports (32 x 32 x 32) ---
  cross_rd_rs1_rs2: cross cp_rd, cp_rs1, cp_rs2 {
    ignore_bins IGN_OFF = cross_rd_rs1_rs2 with (!reg_crosses_enabled);
  }

  // --- Extreme values (toggles: all 0 bits or all 1 bits) ---
  // Uses macro defined in defs.sv
  `ISACOV_CP_BITWISE(cp_rs1_toggle, instr.rs1_value, 32)
  `ISACOV_CP_BITWISE(cp_rs2_toggle, instr.rs2_value, 32)
  `ISACOV_CP_BITWISE(cp_rd_toggle,  instr.rd_value,  32)
endgroup : cg_rtype


// ----------------------------------------------------------------------------
// 3. I-TYPE (ADDI, XORI, ORI, ANDI)
// ----------------------------------------------------------------------------
covergroup cg_itype(
  string cg_name, 
  bit reg_crosses_enabled, 
  bit reg_hazards_enabled
) with function sample(uvma_isacov_instr instr);
  
  option.per_instance = 1;
  option.name = cg_name;

  cp_rs1: coverpoint instr.rs1 { bins regs[] = {[0:31]}; }
  cp_rd:  coverpoint instr.rd  { bins regs[] = {[0:31]}; }
  
  // I-Type has a 12-bit immediate (we test its extreme values here)
  cp_imm: coverpoint instr.immi {
    bins zero       = {0};
    bins all_ones   = {32'hFFFF_FFFF}; // Sign-extended -1
    bins positive   = {[1 : 32'h0000_07FF]};
    bins negative   = {[32'hFFFF_F800 : 32'hFFFF_FFFE]};
  }

  cp_rd_rs1_hazard: coverpoint instr.rd {
    ignore_bins IGN_OFF = {[0:$]} with (!reg_hazards_enabled);
    bins HAZARD[] = {[0:31]} iff (instr.rd == instr.rs1);
  }

  cross_rd_rs1: cross cp_rd, cp_rs1 {
    ignore_bins IGN_OFF = cross_rd_rs1 with (!reg_crosses_enabled);
  }
endgroup : cg_itype


// ----------------------------------------------------------------------------
// 4. B-TYPE (BRANCHES: BEQ, BNE, BLT, BGE...)
// ----------------------------------------------------------------------------
covergroup cg_btype(
  string cg_name, 
  bit reg_crosses_enabled
) with function sample(uvma_isacov_instr instr);
  
  option.per_instance = 1;
  option.name = cg_name;

  cp_rs1: coverpoint instr.rs1 { bins regs[] = {[0:31]}; }
  cp_rs2: coverpoint instr.rs2 { bins regs[] = {[0:31]}; }

  // Core branch point: taken or not taken?
  cp_branch_taken: coverpoint instr.is_branch_taken() {
    bins not_taken = {0};
    bins taken     = {1};
  }

  // Did branch jump backward (loop) or forward (if-else)?
  cp_branch_direction: coverpoint instr.immb[31] {
    bins forward  = {0}; // Offset positivo
    bins backward = {1}; // Negative signed offset
  }

  // Cross direction with result (jumped forward, not jumped backward, etc.)
  cross_taken_dir: cross cp_branch_taken, cp_branch_direction;

endgroup : cg_btype


// ----------------------------------------------------------------------------
// 5. MEMORY-LOAD TYPE (LB, LH, LW)
// ----------------------------------------------------------------------------
covergroup cg_itype_load(
  string cg_name, 
  bit reg_crosses_enabled, 
  bit reg_hazards_enabled
) with function sample(uvma_isacov_instr instr);
  
  option.per_instance = 1;
  option.name = cg_name;

  cp_rs1: coverpoint instr.rs1 { bins regs[] = {[0:31]}; }
  cp_rd:  coverpoint instr.rd  { bins regs[] = {[0:31]}; }
  
  // Memory offset coverage (address = rs1 + immi)
  cp_offset: coverpoint instr.immi {
    bins zero     = {0};
    bins positive = {[1 : 32'h0000_07FF]};
    bins negative = {[32'hFFFF_F800 : 32'hFFFF_FFFE]};
  }

  // Classic corner case: load into base register (e.g., LW x5, 0(x5))
  cp_rd_rs1_hazard: coverpoint instr.rd {
    ignore_bins IGN_OFF = {[0:$]} with (!reg_hazards_enabled);
    bins HAZARD[] = {[0:31]} iff (instr.rd == instr.rs1);
  }
endgroup : cg_itype_load


// ----------------------------------------------------------------------------
// 6. SCENARIO D: SEQUENTIAL (pipeline RAW hazard focus)
// ----------------------------------------------------------------------------
covergroup cg_sequential(
  bit reg_hazards_enabled
) with function sample(uvma_isacov_instr instr, uvma_isacov_instr instr_prev);
  
  option.per_instance = 1;
  option.name = "cg_sequential_hazards";

  // Only active when configuration flag allows it
  cp_hazard_enabled: coverpoint reg_hazards_enabled {
    ignore_bins IGN = {0};
  }

  // Read-After-Write (RAW) no RS1
  // Does current instruction use in RS1 what previous instruction wrote to RD?
  cp_raw_hazard_rs1: coverpoint instr.rs1 {
    ignore_bins IGN_OFF = {[0:$]} with (!reg_hazards_enabled);
    
    // Ignore x0 since writing x0 creates no real hazard (hardwired to 0)
    ignore_bins IGN_X0  = {0}; 
    
    bins HAZARD[] = {[1:31]} iff (
      instr.rs1_valid && 
      instr_prev.rd_valid && 
      (instr.rs1 == instr_prev.rd)
    );
  }

  // Read-After-Write (RAW) no RS2
  cp_raw_hazard_rs2: coverpoint instr.rs2 {
    ignore_bins IGN_OFF = {[0:$]} with (!reg_hazards_enabled);
    ignore_bins IGN_X0  = {0};
    
    bins HAZARD[] = {[1:31]} iff (
      instr.rs2_valid && 
      instr_prev.rd_valid && 
      (instr.rs2 == instr_prev.rd)
    );
  }

endgroup : cg_sequential

// ----------------------------------------------------------------------------
// 7. COMPARISONS (SLT, SLTU) AND SHIFTS (SLL, SRL, SRA)
// ----------------------------------------------------------------------------
covergroup cg_rtype_slt(string cg_name, bit reg_crosses_enabled, bit reg_hazards_enabled) 
  with function sample(uvma_isacov_instr instr);
  option.per_instance = 1; option.name = cg_name;

  cp_rs1: coverpoint instr.rs1 { bins regs[] = {[0:31]}; }
  cp_rs2: coverpoint instr.rs2 { bins regs[] = {[0:31]}; }
  
  // Key difference: RD can only be 0 or 1
  cp_rd_value: coverpoint instr.rd_value { bins boolean[] = {[0:1]}; }
  
  cross_rs1_rs2: cross cp_rs1, cp_rs2 {
    ignore_bins IGN_OFF = cross_rs1_rs2 with (!reg_crosses_enabled);
  }
endgroup : cg_rtype_slt

covergroup cg_rtype_shift(string cg_name, bit reg_crosses_enabled, bit reg_hazards_enabled) 
  with function sample(uvma_isacov_instr instr);
  option.per_instance = 1; option.name = cg_name;

  cp_rs1: coverpoint instr.rs1 { bins regs[] = {[0:31]}; }
  cp_rd:  coverpoint instr.rd  { bins regs[] = {[0:31]}; }
  
  // Key difference: shift amount (RS2) only goes from 0 to 31
  cp_shift_amount: coverpoint instr.rs2_value[4:0] { bins amount[] = {[0:31]}; }
endgroup : cg_rtype_shift

covergroup cg_itype_slt(string cg_name, bit reg_crosses_enabled, bit reg_hazards_enabled) 
  with function sample(uvma_isacov_instr instr);
  option.per_instance = 1; option.name = cg_name;

  cp_rs1: coverpoint instr.rs1 { bins regs[] = {[0:31]}; }
  cp_rd_value: coverpoint instr.rd_value { bins boolean[] = {[0:1]}; }
endgroup : cg_itype_slt

covergroup cg_itype_shift(string cg_name, bit reg_crosses_enabled, bit reg_hazards_enabled) 
  with function sample(uvma_isacov_instr instr);
  option.per_instance = 1; option.name = cg_name;

  cp_rs1: coverpoint instr.rs1 { bins regs[] = {[0:31]}; }
  cp_rd:  coverpoint instr.rd  { bins regs[] = {[0:31]}; }
  cp_shift_amount: coverpoint instr.immi[4:0] { bins amount[] = {[0:31]}; }
endgroup : cg_itype_shift

// ----------------------------------------------------------------------------
// 8. S-TYPE (STORES: SB, SH, SW)
// ----------------------------------------------------------------------------
covergroup cg_stype(string cg_name, bit reg_crosses_enabled) 
  with function sample(uvma_isacov_instr instr);
  option.per_instance = 1; option.name = cg_name;

  cp_rs1: coverpoint instr.rs1 { bins regs[] = {[0:31]}; } // Base address
  cp_rs2: coverpoint instr.rs2 { bins regs[] = {[0:31]}; } // Data to store
  
  cp_offset: coverpoint instr.imms {
    bins zero     = {0};
    bins positive = {[1 : 32'h0000_07FF]};
    bins negative = {[32'hFFFF_F800 : 32'hFFFF_FFFE]};
  }
  cross_rs1_rs2: cross cp_rs1, cp_rs2 {
    ignore_bins IGN_OFF = cross_rs1_rs2 with (!reg_crosses_enabled);
  }
endgroup : cg_stype

// ----------------------------------------------------------------------------
// 9. U-TYPE (LUI, AUIPC) and J-TYPE (JAL)
// ----------------------------------------------------------------------------
covergroup cg_utype(string cg_name) with function sample(uvma_isacov_instr instr);
  option.per_instance = 1; option.name = cg_name;
  cp_rd: coverpoint instr.rd { bins regs[] = {[0:31]}; }
  // Tests if upper 20 bits were exercised (lower 12 bits are 0)
  `ISACOV_CP_BITWISE(cp_immu_toggle, instr.immu[31:12], 20)
endgroup : cg_utype

covergroup cg_jtype(string cg_name) with function sample(uvma_isacov_instr instr);
  option.per_instance = 1; option.name = cg_name;
  cp_rd: coverpoint instr.rd { bins regs[] = {[0:31]}; }
  cp_direction: coverpoint instr.immj[31] {
    bins forward  = {0};
    bins backward = {1};
  }
endgroup  : cg_jtype

// ----------------------------------------------------------------------------
// 10. RV32M - DIVISION (corner cases)
// ----------------------------------------------------------------------------
covergroup cg_div_special_results(string cg_name) with function sample(uvma_isacov_instr instr);
  option.per_instance = 1; option.name = cg_name;
  
  // Per RISC-V spec: division by zero = all bits set to 1 (-1)
  cp_div_by_zero: coverpoint instr.rs2_value {
    bins div_by_zero = {0};
  }
  
  // Per RISC-V spec: overflow only occurs in signed division when:
  // rs1 = -2^31 (0x80000000) e rs2 = -1 (0xFFFFFFFF)
  cp_overflow: coverpoint {instr.rs1_value, instr.rs2_value} {
    bins overflow_case = { {32'h8000_0000, 32'hFFFF_FFFF} };
  }
endgroup : cg_div_special_results

// ----------------------------------------------------------------------------
// 11. SYSTEM AND CSR (Zicsr)
// ----------------------------------------------------------------------------
covergroup cg_executed_type(string cg_name, instr_name_e target_instr) with function sample(uvma_isacov_instr instr);
  option.per_instance = 1; option.name = cg_name;
  // Only ensures instruction (e.g., ECALL, WFI) executed at least once
  cp_executed: coverpoint instr.name {
    bins executed = {target_instr}; 
  }
endgroup : cg_executed_type

covergroup cg_csrtype(string cg_name, bit reg_crosses_enabled) 
  with function sample(uvma_isacov_instr instr);
  option.per_instance = 1; option.name = cg_name;

  cp_rs1: coverpoint instr.rs1 { bins regs[] = {[0:31]}; }
  cp_rd:  coverpoint instr.rd  { bins regs[] = {[0:31]}; }
  
  // Ensures access to multiple CSR addresses
  `ISACOV_CP_BITWISE(cp_csr_addr_toggle, instr.csr_val, 12)
endgroup : cg_csrtype

covergroup cg_csritype(string cg_name) with function sample(uvma_isacov_instr instr);
  option.per_instance = 1; option.name = cg_name;

  cp_rd: coverpoint instr.rd { bins regs[] = {[0:31]}; }
  cp_imm: coverpoint instr.rs1 { bins imm5[] = {[0:31]}; } // In CSRI, rs1 acts as 5-bit immediate
  `ISACOV_CP_BITWISE(cp_csr_addr_toggle, instr.csr_val, 12)
endgroup : cg_csritype
