`ifndef __UVMA_RVFI_SEQ_ITEM_SV__
`define __UVMA_RVFI_SEQ_ITEM_SV__

class uvma_rvfi_seq_item extends uvm_sequence_item;

  // Core pipeline signals
  rand bit [63:0] order;
  rand bit [31:0] insn;
  rand bit        trap;
  rand bit        halt;
  rand bit        intr;
  rand bit [ 1:0] mode;
  rand bit [ 1:0] ixl;
  rand bit [31:0] pc_rdata;
  rand bit [31:0] pc_wdata;

  // Registers
  rand bit [ 4:0] rs1_addr;
  rand bit [31:0] rs1_rdata;
  rand bit [ 4:0] rs2_addr;
  rand bit [31:0] rs2_rdata;
  rand bit [ 4:0] rs3_addr;
  rand bit [31:0] rs3_rdata;
  rand bit [ 4:0] rd_addr;
  rand bit [31:0] rd_wdata;

  // Memory
  rand bit [31:0] mem_addr;
  rand bit [ 3:0] mem_rmask;
  rand bit [31:0] mem_rdata;
  rand bit [ 3:0] mem_wmask;
  rand bit [31:0] mem_wdata;

  // Extended signals
  rand bit [31:0] ext_pre_mip;
  rand bit [31:0] ext_post_mip;
  rand bit        ext_nmi;
  rand bit        ext_nmi_int;
  rand bit        ext_debug_req;
  rand bit        ext_debug_mode;
  rand bit        ext_rf_wr_suppress;
  rand bit [63:0] ext_mcycle;
  rand logic [31:0] ext_mhpmcounters  [10];
  rand logic [31:0] ext_mhpmcountersh [10];
  rand bit        ext_ic_scr_key_valid;
  rand bit        ext_irq_valid;

  `uvm_object_utils_begin(uvma_rvfi_seq_item)
    `uvm_field_int(order,     UVM_DEFAULT | UVM_DEC)
    `uvm_field_int(insn,      UVM_DEFAULT | UVM_HEX)
    `uvm_field_int(trap,      UVM_DEFAULT)
    `uvm_field_int(halt,      UVM_DEFAULT)
    `uvm_field_int(intr,      UVM_DEFAULT)
    `uvm_field_int(mode,      UVM_DEFAULT | UVM_BIN)
    `uvm_field_int(ixl,       UVM_DEFAULT | UVM_DEC)
    `uvm_field_int(pc_rdata,  UVM_DEFAULT | UVM_HEX)
    `uvm_field_int(pc_wdata,  UVM_DEFAULT | UVM_HEX)
    `uvm_field_int(rs1_addr,  UVM_DEFAULT | UVM_DEC)
    `uvm_field_int(rs1_rdata, UVM_DEFAULT | UVM_HEX)
    `uvm_field_int(rs2_addr,  UVM_DEFAULT | UVM_DEC)
    `uvm_field_int(rs2_rdata, UVM_DEFAULT | UVM_HEX)
    `uvm_field_int(rs3_addr,  UVM_DEFAULT | UVM_DEC)
    `uvm_field_int(rs3_rdata, UVM_DEFAULT | UVM_HEX)
    `uvm_field_int(rd_addr,   UVM_DEFAULT | UVM_DEC)
    `uvm_field_int(rd_wdata,  UVM_DEFAULT | UVM_HEX)
    `uvm_field_int(mem_addr,  UVM_DEFAULT | UVM_HEX)
    `uvm_field_int(mem_rmask, UVM_DEFAULT | UVM_BIN)
    `uvm_field_int(mem_rdata, UVM_DEFAULT | UVM_HEX)
    `uvm_field_int(mem_wmask, UVM_DEFAULT | UVM_BIN)
    `uvm_field_int(mem_wdata, UVM_DEFAULT | UVM_HEX)
    `uvm_field_int(ext_pre_mip,         UVM_DEFAULT | UVM_HEX)
    `uvm_field_int(ext_post_mip,        UVM_DEFAULT | UVM_HEX)
    `uvm_field_int(ext_nmi,             UVM_DEFAULT)
    `uvm_field_int(ext_nmi_int,         UVM_DEFAULT)
    `uvm_field_int(ext_debug_req,       UVM_DEFAULT)
    `uvm_field_int(ext_debug_mode,      UVM_DEFAULT | UVM_DEC)
    `uvm_field_int(ext_rf_wr_suppress,  UVM_DEFAULT)
    `uvm_field_int(ext_mcycle,          UVM_DEFAULT | UVM_DEC)
    `uvm_field_sarray_int(ext_mhpmcounters,  UVM_DEFAULT | UVM_HEX)
    `uvm_field_sarray_int(ext_mhpmcountersh, UVM_DEFAULT | UVM_HEX)
    `uvm_field_int(ext_ic_scr_key_valid,UVM_DEFAULT)
    `uvm_field_int(ext_irq_valid,       UVM_DEFAULT)
  `uvm_object_utils_end

  function new(string name="uvma_rvfi_seq_item");
    super.new(name);
  endfunction

  // Clean print format to simplify terminal debugging
  function string convert2string();
    string s;
    s = $sformatf("RVFI [PC: 0x%08x] INSN: 0x%08x", pc_rdata, insn);
    if (rd_addr   != 0) s = {s, $sformatf(" | Reg[x%0d] = 0x%08x", rd_addr, rd_wdata)};
    if (mem_wmask != 0) s = {s, $sformatf(" | Mem Write [0x%08x] = 0x%08x", mem_addr, mem_wdata)};
    if (mem_rmask != 0) s = {s, $sformatf(" | Mem Read  [0x%08x] = 0x%08x", mem_addr, mem_rdata)};
    return s;
  endfunction

endclass : uvma_rvfi_seq_item

`endif // __UVMA_RVFI_SEQ_ITEM_SV__