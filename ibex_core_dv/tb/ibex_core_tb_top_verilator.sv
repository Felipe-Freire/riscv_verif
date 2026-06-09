// ==============================================================================
// ibex_core_tb_top_verilator.sv — UVM-Free Top-Level for Verilator
// ==============================================================================
// A lightweight wrapper that instantiates ibex_top_tracing with the same
// parameters as the UVM testbench, but exposes all signals as raw ports for
// the C++ tb_top.cpp to drive. No UVM, no virtual interfaces, no uvm_config_db.
//
// RVFI signals are wired out as top-level outputs since ibex_top_tracing
// only declares them as internal wires (not module ports).
// ==============================================================================

module ibex_core_tb_top_verilator
  import ibex_pkg::*;
  import prim_ram_1p_pkg::*;
(
  // Clock and Reset (driven by tb_top.cpp)
  input  logic        clk_i,
  input  logic        rst_ni,

  // ---- Instruction Memory Interface ----
  output logic        instr_req_o,
  input  logic        instr_gnt_i,
  input  logic        instr_rvalid_i,
  output logic [31:0] instr_addr_o,
  input  logic [31:0] instr_rdata_i,
  input  logic [6:0]  instr_rdata_intg_i,
  input  logic        instr_err_i,

  // ---- Data Memory Interface ----
  output logic        data_req_o,
  input  logic        data_gnt_i,
  input  logic        data_rvalid_i,
  output logic        data_we_o,
  output logic [3:0]  data_be_o,
  output logic [31:0] data_addr_o,
  output logic [31:0] data_wdata_o,
  output logic [6:0]  data_wdata_intg_o,
  input  logic [31:0] data_rdata_i,
  input  logic [6:0]  data_rdata_intg_i,
  input  logic        data_err_i,

  // ---- Interrupt Inputs ----
  input  logic        irq_software_i,
  input  logic        irq_timer_i,
  input  logic        irq_external_i,
  input  logic [14:0] irq_fast_i,
  input  logic        irq_nm_i,

  // ---- RVFI Lockstep Outputs (from ibex_top_tracing internal wires) ----
  output logic        rvfi_valid_o,
  output logic [63:0] rvfi_order_o,
  output logic [31:0] rvfi_insn_o,
  output logic        rvfi_trap_o,
  output logic        rvfi_halt_o,
  output logic        rvfi_intr_o,
  output logic [1:0]  rvfi_mode_o,
  output logic [1:0]  rvfi_ixl_o,
  output logic [4:0]  rvfi_rs1_addr_o,
  output logic [31:0] rvfi_rs1_rdata_o,
  output logic [4:0]  rvfi_rs2_addr_o,
  output logic [31:0] rvfi_rs2_rdata_o,
  output logic [4:0]  rvfi_rs3_addr_o,
  output logic [31:0] rvfi_rs3_rdata_o,
  output logic [4:0]  rvfi_rd_addr_o,
  output logic [31:0] rvfi_rd_wdata_o,
  output logic [31:0] rvfi_pc_rdata_o,
  output logic [31:0] rvfi_pc_wdata_o,
  output logic [31:0] rvfi_mem_addr_o,
  output logic [3:0]  rvfi_mem_rmask_o,
  output logic [3:0]  rvfi_mem_wmask_o,
  output logic [31:0] rvfi_mem_rdata_o,
  output logic [31:0] rvfi_mem_wdata_o
);

  // Ibex Parameters — identical to ibex_core_tb_top.sv (UVM version)
  localparam bit          PMPEnable        = 1'b0;
  localparam int unsigned PMPGranularity   = 0;
  localparam int unsigned PMPNumRegions    = 4;
  localparam int unsigned MHPMCounterNum   = 0;
  localparam int unsigned MHPMCounterWidth = 40;
  localparam bit          RV32E            = 1'b0;
  localparam rv32m_e      RV32M            = RV32MFast;
  localparam rv32b_e      RV32B            = RV32BNone;
  localparam regfile_e    RegFile          = RegFileFF;
  localparam bit          BranchTargetALU  = 1'b0;
  localparam bit          WritebackStage   = 1'b0;
  localparam bit          ICache           = 1'b0;
  localparam bit          ICacheECC        = 1'b0;
  localparam bit          BranchPredictor  = 1'b0;
  localparam bit          SecureIbex       = 1'b0;
  localparam bit          ICacheScramble   = 1'b0;
  localparam bit          DbgTriggerEn     = 1'b0;
  localparam int unsigned DmBaseAddr       = 32'h1A11_0000;
  localparam int unsigned DmAddrMask       = 32'h0000_0FFF;
  localparam int unsigned DmHaltAddr       = 32'h8000_0000;
  localparam int unsigned DmExceptionAddr  = 32'h8000_0008;

  localparam int unsigned BootAddr = 32'h8000_0000;
  localparam ibex_mubi_t  FetchEn = IbexMuBiOn;

  // Unused DUT outputs
  logic                         scramble_req;
  crash_dump_t                  crash_dump;
  logic                         double_fault_seen;
  logic                         alert_minor;
  logic                         alert_major_internal;
  logic                         alert_major_bus;
  logic                         core_sleep;

  // DUT instance
  ibex_top_tracing #(
    .PMPEnable        (PMPEnable        ),
    .PMPGranularity   (PMPGranularity   ),
    .PMPNumRegions    (PMPNumRegions    ),
    .MHPMCounterNum   (MHPMCounterNum   ),
    .MHPMCounterWidth (MHPMCounterWidth ),
    .RV32E            (RV32E            ),
    .RV32M            (RV32M            ),
    .RV32B            (RV32B            ),
    .RegFile          (RegFile          ),
    .BranchTargetALU  (BranchTargetALU  ),
    .WritebackStage   (WritebackStage   ),
    .ICache           (ICache           ),
    .ICacheECC        (ICacheECC        ),
    .SecureIbex       (SecureIbex       ),
    .ICacheScramble   (ICacheScramble   ),
    .BranchPredictor  (BranchPredictor  ),
    .DbgTriggerEn     (DbgTriggerEn     ),
    .DmBaseAddr       (DmBaseAddr       ),
    .DmAddrMask       (DmAddrMask       ),
    .DmHaltAddr       (DmHaltAddr       ),
    .DmExceptionAddr  (DmExceptionAddr  )
  ) dut (
    // Clock and Reset
    .clk_i       (clk_i),
    .rst_ni      (rst_ni),

    // Test and Configuration Signals
    .test_en_i   (1'b0),
    .scan_rst_ni (1'b1),
    .ram_cfg_i   ('0),
    .hart_id_i   (32'h0),
    .boot_addr_i (BootAddr),

    // Execution Control
    .fetch_enable_i         (FetchEn),
    .alert_minor_o          (alert_minor),
    .alert_major_internal_o (alert_major_internal),
    .alert_major_bus_o      (alert_major_bus),
    .core_sleep_o           (core_sleep),

    // Interrupts
    .irq_software_i (irq_software_i),
    .irq_timer_i    (irq_timer_i),
    .irq_external_i (irq_external_i),
    .irq_fast_i     (irq_fast_i),
    .irq_nm_i       (irq_nm_i),

    // Scrambling Interface
    .scramble_key_valid_i (1'b0),
    .scramble_key_i       ('0),
    .scramble_nonce_i     ('0),
    .scramble_req_o       (scramble_req),

    // Debug Interface
    .debug_req_i         (1'b0),
    .crash_dump_o        (crash_dump),
    .double_fault_seen_o (double_fault_seen),

    // Instruction Interface
    .instr_req_o        (instr_req_o),
    .instr_gnt_i        (instr_gnt_i),
    .instr_rvalid_i     (instr_rvalid_i),
    .instr_addr_o       (instr_addr_o),
    .instr_rdata_i      (instr_rdata_i),
    .instr_rdata_intg_i (instr_rdata_intg_i),
    .instr_err_i        (instr_err_i),

    // Data Interface
    .data_req_o         (data_req_o),
    .data_gnt_i         (data_gnt_i),
    .data_rvalid_i      (data_rvalid_i),
    .data_we_o          (data_we_o),
    .data_be_o          (data_be_o),
    .data_addr_o        (data_addr_o),
    .data_wdata_o       (data_wdata_o),
    .data_wdata_intg_o  (data_wdata_intg_o),
    .data_rdata_i       (data_rdata_i),
    .data_rdata_intg_i  (data_rdata_intg_i),
    .data_err_i         (data_err_i)
  );

  // ---- RVFI Wiring: internal signals → top-level output ports ----
  // ibex_top_tracing declares RVFI as internal wires, not ports.
  // We bridge them out here for the C++ testbench to observe.
  assign rvfi_valid_o     = dut.rvfi_valid;
  assign rvfi_order_o     = dut.rvfi_order;
  assign rvfi_insn_o      = dut.rvfi_insn;
  assign rvfi_trap_o      = dut.rvfi_trap;
  assign rvfi_halt_o      = dut.rvfi_halt;
  assign rvfi_intr_o      = dut.rvfi_intr;
  assign rvfi_mode_o      = dut.rvfi_mode;
  assign rvfi_ixl_o       = dut.rvfi_ixl;
  assign rvfi_rs1_addr_o  = dut.rvfi_rs1_addr;
  assign rvfi_rs1_rdata_o = dut.rvfi_rs1_rdata;
  assign rvfi_rs2_addr_o  = dut.rvfi_rs2_addr;
  assign rvfi_rs2_rdata_o = dut.rvfi_rs2_rdata;
  assign rvfi_rs3_addr_o  = dut.rvfi_rs3_addr;
  assign rvfi_rs3_rdata_o = dut.rvfi_rs3_rdata;
  assign rvfi_rd_addr_o   = dut.rvfi_rd_addr;
  assign rvfi_rd_wdata_o  = dut.rvfi_rd_wdata;
  assign rvfi_pc_rdata_o  = dut.rvfi_pc_rdata;
  assign rvfi_pc_wdata_o  = dut.rvfi_pc_wdata;
  assign rvfi_mem_addr_o  = dut.rvfi_mem_addr;
  assign rvfi_mem_rmask_o = dut.rvfi_mem_rmask;
  assign rvfi_mem_wmask_o = dut.rvfi_mem_wmask;
  assign rvfi_mem_rdata_o = dut.rvfi_mem_rdata;
  assign rvfi_mem_wdata_o = dut.rvfi_mem_wdata;

endmodule
