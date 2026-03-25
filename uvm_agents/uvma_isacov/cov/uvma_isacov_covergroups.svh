// ============================================================================
// ARQUIVO: uvma_isacov_covergroups.svh
// DESCRIÇÃO: Definições matemáticas dos Covergroups (Templates/Fôrmas de Bolo).
// ATENÇÃO: Este arquivo não contém uma classe (class/endclass). Ele foi feito
// para ser inserido (via `include) diretamente DENTRO da classe cov_model.
// ============================================================================

// ----------------------------------------------------------------------------
// 1. CENÁRIO A: O DASHBOARD GERAL DE OPCODES (O Álbum Principal)
// ----------------------------------------------------------------------------
covergroup cg_instr_names with function sample(uvma_isacov_instr instr);
  option.per_instance = 1;
  option.name = "cg_instr_names_dashboard";

  // Garante que vimos todas as instruções suportadas pelo núcleo
  cp_opcode: coverpoint instr.name {
    // Ignoramos instruções desconhecidas ou ilegais no dashboard de sucesso
    ignore_bins ign = {UNKNOWN_INSTR};
  }
endgroup : cg_instr_names


// ----------------------------------------------------------------------------
// 2. CENÁRIOS B e C: R-TYPE (ADD, SUB, AND, OR, XOR, MUL, DIV)
// ----------------------------------------------------------------------------
covergroup cg_rtype(
  string cg_name, 
  bit reg_crosses_enabled,
  bit reg_hazards_enabled
) with function sample(uvma_isacov_instr instr);
  
  option.per_instance = 1;
  option.name = cg_name;

  // --- Cobertura Básica de Registradores ---
  cp_rs1: coverpoint instr.rs1 { bins regs[] = {[0:31]}; }
  cp_rs2: coverpoint instr.rs2 { bins regs[] = {[0:31]}; }
  cp_rd:  coverpoint instr.rd  { bins regs[] = {[0:31]}; }

  // --- Hazards Intra-Instrução (Ex: ADD x5, x5, x2) ---
  cp_rd_rs1_hazard: coverpoint instr.rd {
    ignore_bins IGN_OFF = {[0:$]} with (!reg_hazards_enabled);
    bins HAZARD[] = {[0:31]} iff (instr.rd == instr.rs1);
  }
  cp_rd_rs2_hazard: coverpoint instr.rd {
    ignore_bins IGN_OFF = {[0:$]} with (!reg_hazards_enabled);
    bins HAZARD[] = {[0:31]} iff (instr.rd == instr.rs2);
  }

  // --- Explosão Combinatória: Todas as portas da ALU (32 x 32 x 32) ---
  cross_rd_rs1_rs2: cross cp_rd, cp_rs1, cp_rs2 {
    ignore_bins IGN_OFF = cross_rd_rs1_rs2 with (!reg_crosses_enabled);
  }

  // --- Valores Extremos (Toggles: Todos os bits 0 ou todos os bits 1) ---
  // Utiliza a macro que definimos no defs.sv
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
  
  // I-Type possui um imediato de 12 bits (aqui testamos os valores extremos dele)
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

  // O ponto crucial de um Branch: Ele saltou ou não saltou?
  cp_branch_taken: coverpoint instr.is_branch_taken() {
    bins not_taken = {0};
    bins taken     = {1};
  }

  // O Branch saltou para trás (loop) ou para frente (if-else)?
  cp_branch_direction: coverpoint instr.immb[31] {
    bins forward  = {0}; // Offset positivo
    bins backward = {1}; // Offset negativo (sinal)
  }

  // Cruzamos a direção com o resultado (saltou pra frente, não saltou pra trás, etc)
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
  
  // Cobertura de Offset de Memória (Endereço = rs1 + immi)
  cp_offset: coverpoint instr.immi {
    bins zero     = {0};
    bins positive = {[1 : 32'h0000_07FF]};
    bins negative = {[32'hFFFF_F800 : 32'hFFFF_FFFE]};
  }

  // Testando o corner case clássico: Load no registrador base (Ex: LW x5, 0(x5))
  cp_rd_rs1_hazard: coverpoint instr.rd {
    ignore_bins IGN_OFF = {[0:$]} with (!reg_hazards_enabled);
    bins HAZARD[] = {[0:31]} iff (instr.rd == instr.rs1);
  }
endgroup : cg_itype_load


// ----------------------------------------------------------------------------
// 6. CENÁRIO D: SEQUENCIAL (O Rei do Pipeline RAW Hazard)
// ----------------------------------------------------------------------------
covergroup cg_sequential(
  bit reg_hazards_enabled
) with function sample(uvma_isacov_instr instr, uvma_isacov_instr instr_prev);
  
  option.per_instance = 1;
  option.name = "cg_sequential_hazards";

  // Só aciona se a flag de configuração permitir
  cp_hazard_enabled: coverpoint reg_hazards_enabled {
    ignore_bins IGN = {0};
  }

  // Read-After-Write (RAW) no RS1
  // A instrução atual usa no RS1 o que a instrução anterior gravou no RD?
  cp_raw_hazard_rs1: coverpoint instr.rs1 {
    ignore_bins IGN_OFF = {[0:$]} with (!reg_hazards_enabled);
    
    // Ignoramos o x0 porque gravar no x0 não gera hazard real (é hardwired a 0)
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
// 7. COMPARAÇÕES (SLT, SLTU) E SHIFTS (SLL, SRL, SRA)
// ----------------------------------------------------------------------------
covergroup cg_rtype_slt(string cg_name, bit reg_crosses_enabled, bit reg_hazards_enabled) 
  with function sample(uvma_isacov_instr instr);
  option.per_instance = 1; option.name = cg_name;

  cp_rs1: coverpoint instr.rs1 { bins regs[] = {[0:31]}; }
  cp_rs2: coverpoint instr.rs2 { bins regs[] = {[0:31]}; }
  
  // A diferença vital: RD só pode ser 0 ou 1
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
  
  // A diferença vital: O valor de deslocamento (RS2) só vai de 0 a 31
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
// 9. U-TYPE (LUI, AUIPC) e J-TYPE (JAL)
// ----------------------------------------------------------------------------
covergroup cg_utype(string cg_name) with function sample(uvma_isacov_instr instr);
  option.per_instance = 1; option.name = cg_name;
  cp_rd: coverpoint instr.rd { bins regs[] = {[0:31]}; }
  // Testa se os 20 bits superiores foram exercitados (os 12 inferiores são 0)
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
// 10. RV32M - DIVISÃO (Corner Cases)
// ----------------------------------------------------------------------------
covergroup cg_div_special_results(string cg_name) with function sample(uvma_isacov_instr instr);
  option.per_instance = 1; option.name = cg_name;
  
  // Pela norma RISC-V: Divisão por zero = todos os bits em 1 (-1)
  cp_div_by_zero: coverpoint instr.rs2_value {
    bins div_by_zero = {0};
  }
  
  // Pela norma RISC-V: Overflow só ocorre em Signed Div quando:
  // rs1 = -2^31 (0x80000000) e rs2 = -1 (0xFFFFFFFF)
  cp_overflow: coverpoint {instr.rs1_value, instr.rs2_value} {
    bins overflow_case = { {32'h8000_0000, 32'hFFFF_FFFF} };
  }
endgroup : cg_div_special_results

// ----------------------------------------------------------------------------
// 11. SISTEMA E CSR (Zicsr)
// ----------------------------------------------------------------------------
covergroup cg_executed_type(string cg_name, instr_name_e target_instr) with function sample(uvma_isacov_instr instr);
  option.per_instance = 1; option.name = cg_name;
  // Apenas garante que a instrução (ex: ECALL, WFI) foi executada pelo menos 1 vez
  cp_executed: coverpoint instr.name {
    bins executed = {target_instr}; 
  }
endgroup : cg_executed_type

covergroup cg_csrtype(string cg_name, bit reg_crosses_enabled) 
  with function sample(uvma_isacov_instr instr);
  option.per_instance = 1; option.name = cg_name;

  cp_rs1: coverpoint instr.rs1 { bins regs[] = {[0:31]}; }
  cp_rd:  coverpoint instr.rd  { bins regs[] = {[0:31]}; }
  
  // Garante acesso a múltiplos endereços de CSR
  `ISACOV_CP_BITWISE(cp_csr_addr_toggle, instr.csr_val, 12)
endgroup : cg_csrtype

covergroup cg_csritype(string cg_name) with function sample(uvma_isacov_instr instr);
  option.per_instance = 1; option.name = cg_name;

  cp_rd: coverpoint instr.rd { bins regs[] = {[0:31]}; }
  cp_imm: coverpoint instr.rs1 { bins imm5[] = {[0:31]}; } // No CSRI, o rs1 atua como imm de 5 bits
  `ISACOV_CP_BITWISE(cp_csr_addr_toggle, instr.csr_val, 12)
endgroup : cg_csritype
