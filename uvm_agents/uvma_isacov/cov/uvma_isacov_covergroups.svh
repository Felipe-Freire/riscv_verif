// ============================================================================
// FILE: uvma_isacov_covergroups.svh
// DESCRIPTION: Mathematical definitions for covergroups (templates).
// ATTENTION: This file does not contain a class (class/endclass). It is meant
// to be inserted (via `include) directly INSIDE the cov_model class.
// ============================================================================

// ----------------------------------------------------------------------------
// 1. SCENARIO A: GLOBAL OPCODE DASHBOARD (Main album)
// ----------------------------------------------------------------------------
covergroup cg_instr_names with function sample(instr_name_e name);
  option.per_instance = 1;
  option.name = "cg_instr_names_dashboard";

  // Ensure all instructions supported by the core were seen
  cp_opcode: coverpoint name {
    // Ignore unknown or illegal instructions in success dashboard
    ignore_bins ign = {UNKNOWN_INSTR};
  }
endgroup : cg_instr_names


// ----------------------------------------------------------------------------
// 2. SCENARIOS B and C: R-TYPE (ADD, SUB, AND, OR, XOR, MUL, DIV)
// ----------------------------------------------------------------------------
covergroup cg_rtype(
  string cg_name
) with function sample(
  bit [4:0] rs1, bit [4:0] rs2, bit [4:0] rd,
  bit [31:0] rs1_val, bit [31:0] rs2_val, bit [31:0] rd_val,
  bit is_rd_rs1_hazard, bit is_rd_rs2_hazard
);
  
  option.per_instance = 1;
  option.name = cg_name;

  // --- Basic register coverage ---
  cp_rs1: coverpoint rs1 { bins regs[] = {[0:31]}; }
  cp_rs2: coverpoint rs2 { bins regs[] = {[0:31]}; }
  cp_rd:  coverpoint rd  { bins regs[] = {[0:31]}; }

  // --- Intra-instruction hazards (e.g., ADD x5, x5, x2) ---
  cp_rd_rs1_hazard: coverpoint rd {
    bins HAZARD[] = {[0:31]} iff (is_rd_rs1_hazard);
  }
  cp_rd_rs2_hazard: coverpoint rd {
    bins HAZARD[] = {[0:31]} iff (is_rd_rs2_hazard);
  }

  // --- Combinatorial explosion: all ALU ports (32 x 32 x 32) ---
// `ifndef VIVADO_SIM
//   cross_rd_rs1_rs2: cross cp_rd, cp_rs1, cp_rs2;
// `endif

  // --- Extreme values (toggles: all 0 bits or all 1 bits) ---
  // Uses macro defined in defs.sv
  `ISACOV_CP_BITWISE(cp_rs1_toggle, rs1_val, 32)
  `ISACOV_CP_BITWISE(cp_rs2_toggle, rs2_val, 32)
  `ISACOV_CP_BITWISE(cp_rd_toggle,  rd_val,  32)
endgroup : cg_rtype


// ----------------------------------------------------------------------------
// 3. I-TYPE (ADDI, XORI, ORI, ANDI)
// ----------------------------------------------------------------------------
covergroup cg_itype(
  string cg_name
) with function sample(
  bit [4:0] rs1, bit [4:0] rd, bit [11:0] immi, bit is_rd_rs1_hazard
);
  
  option.per_instance = 1;
  option.name = cg_name;

  cp_rs1: coverpoint rs1 { bins regs[] = {[0:31]}; }
  cp_rd:  coverpoint rd  { bins regs[] = {[0:31]}; }
  
  // I-Type has a 12-bit immediate (we test its extreme values here)
  cp_imm: coverpoint immi {
    bins zero       = {0};
    bins all_ones   = {12'hFFF}; // Sign-extended -1
    bins positive   = {[1 : 12'h7FF]};
    bins negative   = {[12'h800 : 12'hFFE]};
  }

  cp_rd_rs1_hazard: coverpoint rd {
    bins HAZARD[] = {[0:31]} iff (is_rd_rs1_hazard);
  }

// `ifndef VIVADO_SIM
//   cross_rd_rs1: cross cp_rd, cp_rs1;
// `endif
endgroup : cg_itype


// ----------------------------------------------------------------------------
// 4. B-TYPE (BRANCHES: BEQ, BNE, BLT, BGE...)
// ----------------------------------------------------------------------------
covergroup cg_btype(
  string cg_name
) with function sample(
  bit [4:0] rs1, bit [4:0] rs2, bit is_taken, bit direction_back
);
  
  option.per_instance = 1;
  option.name = cg_name;

  cp_rs1: coverpoint rs1 { bins regs[] = {[0:31]}; }
  cp_rs2: coverpoint rs2 { bins regs[] = {[0:31]}; }

  // Core branch point: taken or not taken?
  cp_branch_taken: coverpoint is_taken {
    bins not_taken = {0};
    bins taken     = {1};
  }

  // Did branch jump backward (loop) or forward (if-else)?
  cp_branch_direction: coverpoint direction_back {
    bins forward  = {0}; // Offset positivo
    bins backward = {1}; // Negative signed offset
  }

  // Cross direction with result (jumped forward, not jumped backward, etc.)
// `ifndef VIVADO_SIM
//   cross_taken_dir: cross cp_branch_taken, cp_branch_direction;
// `endif

endgroup : cg_btype


// ----------------------------------------------------------------------------
// 5. MEMORY-LOAD TYPE (LB, LH, LW)
// ----------------------------------------------------------------------------
covergroup cg_itype_load(
  string cg_name
) with function sample(
  bit [4:0] rs1, bit [4:0] rd, bit [11:0] immi, bit is_rd_rs1_hazard
);
  
  option.per_instance = 1;
  option.name = cg_name;

  cp_rs1: coverpoint rs1 { bins regs[] = {[0:31]}; }
  cp_rd:  coverpoint rd  { bins regs[] = {[0:31]}; }
  
  // Memory offset coverage (address = rs1 + immi)
  cp_offset: coverpoint immi {
    bins zero     = {0};
    bins positive = {[1 : 12'h7FF]};
    bins negative = {[12'h800 : 12'hFFE]};
  }

  // Classic corner case: load into base register (e.g., LW x5, 0(x5))
  cp_rd_rs1_hazard: coverpoint rd {
    bins HAZARD[] = {[0:31]} iff (is_rd_rs1_hazard);
  }
endgroup : cg_itype_load


// ----------------------------------------------------------------------------
// 6. SCENARIO D: SEQUENTIAL (pipeline RAW hazard focus)
// ----------------------------------------------------------------------------
covergroup cg_sequential() with function sample(
  bit [4:0] rs1, bit [4:0] rs2, bit is_rs1_hazard, bit is_rs2_hazard
);
  
  option.per_instance = 1;
  option.name = "cg_sequential_hazards";

  // Read-After-Write (RAW) no RS1
  cp_raw_hazard_rs1: coverpoint rs1 {
    ignore_bins IGN_X0  = {0}; 
    bins HAZARD[] = {[1:31]} iff (is_rs1_hazard);
  }

  // Read-After-Write (RAW) no RS2
  cp_raw_hazard_rs2: coverpoint rs2 {
    ignore_bins IGN_X0  = {0};
    bins HAZARD[] = {[1:31]} iff (is_rs2_hazard);
  }

endgroup : cg_sequential

// ----------------------------------------------------------------------------
// 7. COMPARISONS (SLT, SLTU) AND SHIFTS (SLL, SRL, SRA)
// ----------------------------------------------------------------------------
covergroup cg_rtype_slt(string cg_name) 
  with function sample(bit [4:0] rs1, bit [4:0] rs2, bit rd_val_lsb);
  option.per_instance = 1; option.name = cg_name;

  cp_rs1: coverpoint rs1 { bins regs[] = {[0:31]}; }
  cp_rs2: coverpoint rs2 { bins regs[] = {[0:31]}; }
  
  // Key difference: RD can only be 0 or 1
  cp_rd_value: coverpoint rd_val_lsb { bins boolean[] = {[0:1]}; }
  
// `ifndef VIVADO_SIM
//   cross_rs1_rs2: cross cp_rs1, cp_rs2;
// `endif
endgroup : cg_rtype_slt

covergroup cg_rtype_shift(string cg_name) 
  with function sample(bit [4:0] rs1, bit [4:0] rd, bit [4:0] shift_amount);
  option.per_instance = 1; option.name = cg_name;

  cp_rs1: coverpoint rs1 { bins regs[] = {[0:31]}; }
  cp_rd:  coverpoint rd  { bins regs[] = {[0:31]}; }
  
  // Key difference: shift amount (RS2) only goes from 0 to 31
  cp_shift_amount: coverpoint shift_amount { bins amount[] = {[0:31]}; }
endgroup : cg_rtype_shift

covergroup cg_itype_slt(string cg_name) 
  with function sample(bit [4:0] rs1, bit rd_val_lsb);
  option.per_instance = 1; option.name = cg_name;

  cp_rs1: coverpoint rs1 { bins regs[] = {[0:31]}; }
  cp_rd_value: coverpoint rd_val_lsb { bins boolean[] = {[0:1]}; }
endgroup : cg_itype_slt

covergroup cg_itype_shift(string cg_name) 
  with function sample(bit [4:0] rs1, bit [4:0] rd, bit [4:0] shift_amount);
  option.per_instance = 1; option.name = cg_name;

  cp_rs1: coverpoint rs1 { bins regs[] = {[0:31]}; }
  cp_rd:  coverpoint rd  { bins regs[] = {[0:31]}; }
  cp_shift_amount: coverpoint shift_amount { bins amount[] = {[0:31]}; }
endgroup : cg_itype_shift

// ----------------------------------------------------------------------------
// 8. S-TYPE (STORES: SB, SH, SW)
// ----------------------------------------------------------------------------
covergroup cg_stype(string cg_name) 
  with function sample(bit [4:0] rs1, bit [4:0] rs2, bit [11:0] imms);
  option.per_instance = 1; option.name = cg_name;

  cp_rs1: coverpoint rs1 { bins regs[] = {[0:31]}; } // Base address
  cp_rs2: coverpoint rs2 { bins regs[] = {[0:31]}; } // Data to store
  
  cp_offset: coverpoint imms {
    bins zero     = {0};
    bins positive = {[1 : 12'h7FF]};
    bins negative = {[12'h800 : 12'hFFE]};
  }
// `ifndef VIVADO_SIM
//   cross_rs1_rs2: cross cp_rs1, cp_rs2;
// `endif
endgroup : cg_stype

// ----------------------------------------------------------------------------
// 9. U-TYPE (LUI, AUIPC) and J-TYPE (JAL)
// ----------------------------------------------------------------------------
covergroup cg_utype(string cg_name) with function sample(bit [4:0] rd, bit [31:0] immu);
  option.per_instance = 1; option.name = cg_name;
  cp_rd: coverpoint rd { bins regs[] = {[0:31]}; }
  // Tests if upper 20 bits were exercised (lower 12 bits are 0)
  `ISACOV_CP_BITWISE(cp_immu_toggle, immu[31:12], 20)
endgroup : cg_utype

covergroup cg_jtype(string cg_name) with function sample(bit [4:0] rd, bit direction_back);
  option.per_instance = 1; option.name = cg_name;
  cp_rd: coverpoint rd { bins regs[] = {[0:31]}; }
  cp_direction: coverpoint direction_back {
    bins forward  = {0};
    bins backward = {1};
  }
endgroup  : cg_jtype

// ----------------------------------------------------------------------------
// 10. RV32M - DIVISION (corner cases)
// ----------------------------------------------------------------------------
covergroup cg_div_special_results(string cg_name) with function sample(bit [31:0] rs1_val, bit [31:0] rs2_val);
  option.per_instance = 1; option.name = cg_name;
  
  // Per RISC-V spec: division by zero = all bits set to 1 (-1)
  cp_div_by_zero: coverpoint rs2_val {
    bins div_by_zero = {0};
  }
  
  // Per RISC-V spec: overflow only occurs in signed division when:
  // rs1 = -2^31 (0x80000000) e rs2 = -1 (0xFFFFFFFF)
  cp_overflow: coverpoint {rs1_val, rs2_val} {
    bins overflow_case = { {32'h8000_0000, 32'hFFFF_FFFF} };
  }
endgroup : cg_div_special_results

// ----------------------------------------------------------------------------
// 11. SYSTEM AND CSR (Zicsr)
// ----------------------------------------------------------------------------
covergroup cg_executed_type(string cg_name, instr_name_e target_instr) with function sample(instr_name_e name);
  option.per_instance = 1; option.name = cg_name;
  // Only ensures instruction (e.g., ECALL, WFI) executed at least once
  cp_executed: coverpoint name {
    bins executed = {target_instr}; 
  }
endgroup : cg_executed_type

covergroup cg_csrtype(string cg_name) 
  with function sample(bit [4:0] rs1, bit [4:0] rd, bit [11:0] csr_val);
  option.per_instance = 1; option.name = cg_name;

  cp_rs1: coverpoint rs1 { bins regs[] = {[0:31]}; }
  cp_rd:  coverpoint rd  { bins regs[] = {[0:31]}; }
  
  // Ensures access to multiple CSR addresses
  `ISACOV_CP_BITWISE(cp_csr_addr_toggle, csr_val, 12)
endgroup : cg_csrtype

covergroup cg_csritype(string cg_name) with function sample(bit [4:0] rd, bit [4:0] rs1, bit [11:0] csr_val);
  option.per_instance = 1; option.name = cg_name;

  cp_rd: coverpoint rd { bins regs[] = {[0:31]}; }
  cp_imm: coverpoint rs1 { bins imm5[] = {[0:31]}; } // In CSRI, rs1 acts as 5-bit immediate
  `ISACOV_CP_BITWISE(cp_csr_addr_toggle, csr_val, 12)
endgroup : cg_csritype
