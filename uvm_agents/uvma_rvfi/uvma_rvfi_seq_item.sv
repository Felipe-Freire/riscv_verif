`ifndef __UVMA_RVFI_SEQ_ITEM_SV__
`define __UVMA_RVFI_SEQ_ITEM_SV__

class uvma_rvfi_seq_item extends uvm_sequence_item;

  // Sinais Core do Pipeline
  rand bit [63:0] order;
  rand bit [31:0] insn;
  rand bit        trap;
  rand bit [31:0] pc_rdata;
  rand bit [31:0] pc_wdata;

  // Registradores
  rand bit [ 4:0] rs1_addr;
  rand bit [31:0] rs1_rdata;
  rand bit [ 4:0] rs2_addr;
  rand bit [31:0] rs2_rdata;
  rand bit [ 4:0] rd_addr;
  rand bit [31:0] rd_wdata;

  // Memória
  rand bit [31:0] mem_addr;
  rand bit [ 3:0] mem_rmask;
  rand bit [31:0] mem_rdata;
  rand bit [ 3:0] mem_wmask;
  rand bit [31:0] mem_wdata;

  `uvm_object_utils_begin(uvma_rvfi_seq_item)
    `uvm_field_int(order,     UVM_DEFAULT | UVM_DEC)
    `uvm_field_int(insn,      UVM_DEFAULT | UVM_HEX)
    `uvm_field_int(trap,      UVM_DEFAULT)
    `uvm_field_int(pc_rdata,  UVM_DEFAULT | UVM_HEX)
    `uvm_field_int(pc_wdata,  UVM_DEFAULT | UVM_HEX)
    `uvm_field_int(rs1_addr,  UVM_DEFAULT | UVM_DEC)
    `uvm_field_int(rs1_rdata, UVM_DEFAULT | UVM_HEX)
    `uvm_field_int(rs2_addr,  UVM_DEFAULT | UVM_DEC)
    `uvm_field_int(rs2_rdata, UVM_DEFAULT | UVM_HEX)
    `uvm_field_int(rd_addr,   UVM_DEFAULT | UVM_DEC)
    `uvm_field_int(rd_wdata,  UVM_DEFAULT | UVM_HEX)
    `uvm_field_int(mem_addr,  UVM_DEFAULT | UVM_HEX)
    `uvm_field_int(mem_rmask, UVM_DEFAULT | UVM_BIN)
    `uvm_field_int(mem_rdata, UVM_DEFAULT | UVM_HEX)
    `uvm_field_int(mem_wmask, UVM_DEFAULT | UVM_BIN)
    `uvm_field_int(mem_wdata, UVM_DEFAULT | UVM_HEX)
  `uvm_object_utils_end

  function new(string name="uvma_rvfi_seq_item");
    super.new(name);
  endfunction

  // Um print limpo para facilitar o nosso debug no terminal
  function string convert2string();
    string s;
    s = $sformatf("RVFI [PC: 0x%08x] INSN: 0x%08x", pc_rdata, insn);
    if (rd_addr != 0)  s = {s, $sformatf(" | Reg[x%0d] = 0x%08x", rd_addr, rd_wdata)};
    if (mem_wmask != 0) s = {s, $sformatf(" | Mem Write [0x%08x] = 0x%08x", mem_addr, mem_wdata)};
    if (mem_rmask != 0) s = {s, $sformatf(" | Mem Read  [0x%08x] = 0x%08x", mem_addr, mem_rdata)};
    return s;
  endfunction

endclass : uvma_rvfi_seq_item

`endif // __UVMA_RVFI_SEQ_ITEM_SV__