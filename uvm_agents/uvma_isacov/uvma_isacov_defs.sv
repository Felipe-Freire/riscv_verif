`ifndef __UVMA_ISACOV_DEFS_SV__
`define __UVMA_ISACOV_DEFS_SV__

// Suported Extensions
typedef enum {
  I_EXT,         // Base Integer Instruction Set (RV32I)
  M_EXT,         // Standard Extension for Integer Multiplication and Division
  C_EXT,         // Standard Extension for Compressed Instructions
  ZICSR_EXT,     // Control and Status Register Instructions
  ZIFENCEI_EXT,  // Instruction-Fetch Fence
  UNKNOWN_EXT
} instr_ext_e;

// Inst
typedef enum {
  // RV32 Types
  R_TYPE,
  I_TYPE,
  S_TYPE,
  B_TYPE,
  U_TYPE,
  J_TYPE,

  // Compressed Types (16-bit)
  CI_TYPE,
  CR_TYPE,
  CSS_TYPE,
  CIW_TYPE,
  CL_TYPE,
  CS_TYPE,
  CA_TYPE,
  CB_TYPE,
  CJ_TYPE,

  // CSR Types
  CSR_TYPE,
  CSRI_TYPE,

  UNKNOWN_TYPE
} instr_type_e;

// Instruction Names 
typedef enum {
  // RV32I
  LUI, AUIPC, JAL, JALR,
  BEQ, BNE, BLT, BGE, BLTU, BGEU,
  LB, LH, LW, LBU, LHU, SB, SH, SW,
  ADDI, SLTI, SLTIU, XORI, ORI, ANDI, SLLI, SRLI, SRAI,
  ADD, SUB, SLL, SLT, SLTU, XOR, SRL, SRA, OR, AND,
  FENCE, ECALL, EBREAK, MRET, WFI,

  // RV32M
  MUL, MULH, MULHSU, MULHU,
  DIV, DIVU, REM, REMU,

  // RV32C
  C_ADDI4SPN, C_LW, C_SW, C_NOP,
  C_ADDI, C_JAL, C_LI, C_ADDI16SP, C_LUI, C_SRLI, C_SRAI,
  C_ANDI, C_SUB, C_XOR, C_OR, C_AND, C_J, C_BEQZ, C_BNEZ,
  C_SLLI, C_LWSP, C_JR, C_MV, C_EBREAK, C_JALR, C_ADD, C_SWSP,

  // Zicsr
  CSRRW, CSRRS, CSRRC,
  CSRRWI, CSRRSI, CSRRCI,

  // Zifencei
  FENCE_I,

  UNKNOWN_INSTR
} instr_name_e;

// Return the extension of a given instruction name
function instr_ext_e get_instr_ext(instr_name_e name);
  if (name inside {
      LUI, AUIPC, JAL, JALR,
      BEQ, BNE, BLT, BGE, BLTU, BGEU,
      LB, LH, LW, LBU, LHU, SB, SH, SW,
      ADDI, SLTI, SLTIU, XORI, ORI, ANDI, SLLI, SRLI, SRAI,
      ADD, SUB, SLL, SLT, SLTU, XOR, SRL, SRA, OR, AND,
      FENCE, ECALL, EBREAK, MRET, WFI
  }) return I_EXT;

  if (name inside {
      MUL, MULH, MULHSU, MULHU,
      DIV, DIVU, REM, REMU
  }) return M_EXT;

  if (name inside {
      C_ADDI4SPN, C_LW, C_SW, C_NOP,
      C_ADDI, C_JAL, C_LI, C_ADDI16SP, C_LUI, C_SRLI, C_SRAI,
      C_ANDI, C_SUB, C_XOR, C_OR, C_AND, C_J, C_BEQZ, C_BNEZ,
      C_SLLI, C_LWSP, C_JR, C_MV, C_EBREAK, C_JALR, C_ADD, C_SWSP
  }) return C_EXT;

  if (name inside {
      CSRRW, CSRRS, CSRRC,
      CSRRWI, CSRRSI, CSRRCI
  }) return ZICSR_EXT;

  if (name inside {
      FENCE_I
  }) return ZIFENCEI_EXT;

  return UNKNOWN_EXT;
endfunction : get_instr_ext


// Return the instruction type based on its name
function instr_type_e get_instr_type(instr_name_e name);
  static instr_name_e itypes[] = '{
    LB, LH, LW, LBU, LHU,
    ADDI, SLTI, SLTIU, XORI, ORI, ANDI, SLLI, SRLI, SRAI,
    JALR
  };
  
  static instr_name_e rtypes[] = '{
    ADD, SUB, SLL, SLT, SLTU, XOR, SRL, SRA, OR, AND,
    MUL, MULH, MULHSU, MULHU, DIV, DIVU, REM, REMU
  };

  if (name inside {rtypes}) return R_TYPE;
  if (name inside {itypes}) return I_TYPE;

  if (name inside {SB, SH, SW}) return S_TYPE;
  if (name inside {BEQ, BNE, BLT, BGE, BLTU, BGEU}) return B_TYPE;
  if (name inside {LUI, AUIPC}) return U_TYPE;
  if (name inside {JAL}) return J_TYPE;

  if (name inside {CSRRW, CSRRS, CSRRC}) return CSR_TYPE;
  if (name inside {CSRRWI, CSRRSI, CSRRCI}) return CSRI_TYPE;

  if (name inside {C_ADDI, C_ADDI16SP, C_LWSP, C_LI, C_LUI, C_SLLI, C_NOP}) return CI_TYPE;
  if (name inside {C_SWSP}) return CSS_TYPE;
  if (name inside {C_MV, C_ADD, C_JR, C_JALR}) return CR_TYPE;
  if (name inside {C_ADDI4SPN}) return CIW_TYPE;
  if (name inside {C_LW}) return CL_TYPE;
  if (name inside {C_SW}) return CS_TYPE;
  if (name inside {C_AND, C_OR, C_XOR, C_SUB}) return CA_TYPE;
  if (name inside {C_BEQZ, C_BNEZ, C_ANDI, C_SRAI, C_SRLI}) return CB_TYPE;
  if (name inside {C_J, C_JAL}) return CJ_TYPE;

  return UNKNOWN_TYPE;
endfunction : get_instr_type

`endif // __UVMA_ISACOV_DEFS_SV__
