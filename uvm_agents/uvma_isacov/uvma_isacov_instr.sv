`ifndef __UVMA_ISACOV_INSTR_SV__
`define __UVMA_ISACOV_INSTR_SV__
  
class uvma_isacov_instr #(int ILEN=DEFAULT_ILEN, int XLEN=DEFAULT_XLEN) extends uvm_object;

  // Metadata
  bit            illegal;
  bit            trap;
  bit [XLEN-1:0] cause;

  instr_name_e   name;
  instr_ext_e    ext;
  instr_type_e   itype;

  // Raw Fields
  bit [11:0] csr_val;
  bit [4:0]  rs1;
  bit [4:0]  rs2;
  bit [4:0]  rd;

  // Immediates
  bit [31:0] immi; // I-Type (12 bits sign-extended)
  bit [31:0] imms; // S-Type (12 bits sign-extended)
  bit [31:0] immb; // B-Type (13 bits sign-extended, bit 0 is 0)
  bit [31:0] immu; // U-Type (32 bits, lower 12 are 0)
  bit [31:0] immj; // J-Type (21 bits sign-extended, bit 0 is 0)

  // Valid Flags
  bit rs1_valid;
  bit rs2_valid;
  bit rd_valid;

  bit [XLEN-1:0] rs1_value;
  bit [XLEN-1:0] rs2_value;
  bit [XLEN-1:0] rd_value;

  uvma_rvfi_seq_item rvfi;

  `uvm_object_utils_begin(uvma_isacov_instr)
    `uvm_field_enum(instr_name_e, name, UVM_ALL_ON | UVM_NOPRINT)
    `uvm_field_enum(instr_ext_e,  ext,  UVM_ALL_ON | UVM_NOPRINT)
    `uvm_field_enum(instr_type_e, itype,UVM_ALL_ON | UVM_NOPRINT)
    
    `uvm_field_int(illegal,   UVM_ALL_ON | UVM_NOPRINT)
    `uvm_field_int(trap,      UVM_ALL_ON | UVM_NOPRINT)
    
    `uvm_field_int(rs1,       UVM_ALL_ON | UVM_NOPRINT)
    `uvm_field_int(rs1_valid, UVM_ALL_ON | UVM_NOPRINT)
    `uvm_field_int(rs1_value, UVM_ALL_ON | UVM_NOPRINT)
    
    `uvm_field_int(rs2,       UVM_ALL_ON | UVM_NOPRINT)
    `uvm_field_int(rs2_valid, UVM_ALL_ON | UVM_NOPRINT)
    `uvm_field_int(rs2_value, UVM_ALL_ON | UVM_NOPRINT)
    
    `uvm_field_int(rd,        UVM_ALL_ON | UVM_NOPRINT)
    `uvm_field_int(rd_valid,  UVM_ALL_ON | UVM_NOPRINT)
    `uvm_field_int(rd_value,  UVM_ALL_ON | UVM_NOPRINT)
    
    `uvm_field_int(immi,      UVM_ALL_ON | UVM_NOPRINT)
    `uvm_field_int(imms,      UVM_ALL_ON | UVM_NOPRINT)
    `uvm_field_int(immb,      UVM_ALL_ON | UVM_NOPRINT)
    `uvm_field_int(immu,      UVM_ALL_ON | UVM_NOPRINT)
    `uvm_field_int(immj,      UVM_ALL_ON | UVM_NOPRINT)
  `uvm_object_utils_end

  function new(string name="uvma_isacov_instr");
    super.new(name);
  endfunction

  // ------------------------------------------------------------------------
  // Main decode engine
  // ------------------------------------------------------------------------
  function void decode();
    if (this.rvfi == null) return;

    this.trap      = this.rvfi.trap;
    this.rs1_value = this.rvfi.rs1_rdata;
    this.rs2_value = this.rvfi.rs2_rdata;
    this.rd_value  = this.rvfi.rd_wdata;
    
    // Extract structural 32-bit fields
    extract_fields(this.rvfi.insn);

    // Identify exact opcode (fills this.name)
    decode_instruction_name(this.rvfi.insn);

    // DEFS.SV power: auto-fill itype and ext from name!
    this.itype = get_instr_type(this.name);
    this.ext   = get_instr_ext(this.name);

    // Use itype to define which registers are valid for this instruction
    set_valid_flags();
  endfunction

  // ------------------------------------------------------------------------
  // Immediate extraction math (RISC-V standard)
  // ------------------------------------------------------------------------
  function void extract_fields(bit [31:0] insn);
    this.rs1 = insn[19:15];
    this.rs2 = insn[24:20];
    this.rd  = insn[11:7];
    
    // Smart sign extension
    this.immi = { {20{insn[31]}}, insn[31:20] };
    this.imms = { {20{insn[31]}}, insn[31:25], insn[11:7] };
    this.immb = { {19{insn[31]}}, insn[31], insn[7], insn[30:25], insn[11:8], 1'b0 };
    this.immu = { insn[31:12], 12'b0 };
    this.immj = { {11{insn[31]}}, insn[31], insn[19:12], insn[20], insn[30:21], 1'b0 };
    this.csr_val = insn[31:20];
  endfunction

  // ------------------------------------------------------------------------
  // ISA decision tree (RV32I + RV32M)
  // ------------------------------------------------------------------------
  function void decode_instruction_name(bit [31:0] insn);
    bit [6:0] opcode = insn[6:0];
    bit [2:0] funct3 = insn[14:12];
    bit [6:0] funct7 = insn[31:25];

    this.illegal = 0;
    this.name = UNKNOWN_INSTR;

    // If instruction has 2 LSBs != 2'b11, it is compressed (RV32C)
    if (insn[1:0] != 2'b11) begin
      // TODO: Implement RV32C decoder in the future
      this.name = UNKNOWN_INSTR; 
      return;
    end

    case (opcode)
      7'b0110111: this.name = LUI;
      7'b0010111: this.name = AUIPC;
      7'b1101111: this.name = JAL;
      7'b1100111: this.name = JALR;
      
      // BRANCH
      7'b1100011: case (funct3)
        3'b000: this.name = BEQ;
        3'b001: this.name = BNE;
        3'b100: this.name = BLT;
        3'b101: this.name = BGE;
        3'b110: this.name = BLTU;
        3'b111: this.name = BGEU;
        default: this.illegal = 1;
      endcase

      // LOAD
      7'b0000011: case (funct3)
        3'b000: this.name = LB;
        3'b001: this.name = LH;
        3'b010: this.name = LW;
        3'b100: this.name = LBU;
        3'b101: this.name = LHU;
        default: this.illegal = 1;
      endcase

      // STORE
      7'b0100011: case (funct3)
        3'b000: this.name = SB;
        3'b001: this.name = SH;
        3'b010: this.name = SW;
        default: this.illegal = 1;
      endcase

      // OP-IMM (I-Type)
      7'b0010011: case (funct3)
        3'b000: this.name = ADDI;
        3'b010: this.name = SLTI;
        3'b011: this.name = SLTIU;
        3'b100: this.name = XORI;
        3'b110: this.name = ORI;
        3'b111: this.name = ANDI;
        3'b001: if (funct7 == 7'b0000000) this.name = SLLI; else this.illegal = 1;
        3'b101: if (funct7 == 7'b0000000) this.name = SRLI;
                else if (funct7 == 7'b0100000) this.name = SRAI;
                else this.illegal = 1;
      endcase

      // OP (R-Type) - RV32I & RV32M
      7'b0110011: case (funct7)
        7'b0000000: case (funct3)
          3'b000: this.name = ADD;
          3'b001: this.name = SLL;
          3'b010: this.name = SLT;
          3'b011: this.name = SLTU;
          3'b100: this.name = XOR;
          3'b101: this.name = SRL;
          3'b110: this.name = OR;
          3'b111: this.name = AND;
        endcase
        7'b0100000: case (funct3)
          3'b000: this.name = SUB;
          3'b101: this.name = SRA;
          default: this.illegal = 1;
        endcase
        7'b0000001: case (funct3) // RV32M (Multiplication/Division)
          3'b000: this.name = MUL;
          3'b001: this.name = MULH;
          3'b010: this.name = MULHSU;
          3'b011: this.name = MULHU;
          3'b100: this.name = DIV;
          3'b101: this.name = DIVU;
          3'b110: this.name = REM;
          3'b111: this.name = REMU;
        endcase
        default: this.illegal = 1;
      endcase

      // SYSTEM (CSRs, ECALL, EBREAK)
      7'b1110011: begin
        if (funct3 == 3'b000) begin
          if (insn[31:20] == 12'h000) this.name = ECALL;
          else if (insn[31:20] == 12'h001) this.name = EBREAK;
          else if (insn[31:20] == 12'h302) this.name = MRET;
          else if (insn[31:20] == 12'h105) this.name = WFI;
          else this.illegal = 1;
        end else begin
          case (funct3)
            3'b001: this.name = CSRRW;
            3'b010: this.name = CSRRS;
            3'b011: this.name = CSRRC;
            3'b101: this.name = CSRRWI;
            3'b110: this.name = CSRRSI;
            3'b111: this.name = CSRRCI;
            default: this.illegal = 1;
          endcase
        end
      end

      // MISC-MEM
      7'b0001111: if (funct3 == 3'b001) this.name = FENCE_I; else this.illegal = 1;

      default: this.illegal = 1;
    endcase
  endfunction

  // ------------------------------------------------------------------------
  // Validity-flag logic (decides whether field should be considered in coverage)
  // ------------------------------------------------------------------------
  function void set_valid_flags();
    this.rs1_valid = 0;
    this.rs2_valid = 0;
    this.rd_valid  = 0;

    // If trap occurred or instruction is illegal, register-valid flags are ignored
    if (this.trap || this.illegal || this.name == UNKNOWN_INSTR) return;

    // Benefit of having itype filled by defs.sv
    case (this.itype)
      R_TYPE: begin this.rs1_valid = 1; this.rs2_valid = 1; this.rd_valid = 1; end
      I_TYPE: begin this.rs1_valid = 1; this.rd_valid  = 1; end
      S_TYPE: begin this.rs1_valid = 1; this.rs2_valid = 1; end
      B_TYPE: begin this.rs1_valid = 1; this.rs2_valid = 1; end
      U_TYPE, J_TYPE: begin this.rd_valid = 1; end
      CSR_TYPE:  begin this.rs1_valid = 1; this.rd_valid = 1; end
      CSRI_TYPE: begin this.rd_valid = 1; end
    endcase
  endfunction

  // ------------------------------------------------------------------------
  // Helper functions (for covergroups)
  // ------------------------------------------------------------------------
  function bit is_branch_taken();
    if (this.itype == B_TYPE) begin
      // RVFI indicates branch taken if written PC differs from read PC + 4 (or +2 for compressed)
      bit [31:0] instr_len = (this.rvfi.insn[1:0] == 2'b11) ? 4 : 2;
      return (this.rvfi.pc_wdata != (this.rvfi.pc_rdata + instr_len));
    end
    return 0;
  endfunction

endclass : uvma_isacov_instr

`endif // __UVMA_ISACOV_INSTR_SV__
