# =============================================================================
# Ibex TCC Coverage Waivers — QuestaSim (.do)
# =============================================================================
# Applied at simulation time via -do to surgically exclude architecturally
# dead or out-of-scope signals/expressions from the coverage database.
#
# Configuration baseline:
#   SecureIbex     = 0    → No lockstep, no dummy instructions, no PC checks
#   ICacheECC      = 0    → No ICache tag/data ECC alerts
#   ICacheScramble = 0    → No ICache RAM MuBi encoding checks
#   RegFileECC     = 0    → No register file ECC (rf_ecc_err_comb = 1'b0)
#   MemECC         = 0    → No memory bus integrity (data_intg_err = 1'b0,
#                           instr_intg_err = 1'b0)
#   ShadowCSR      = 0    → No shadow CSR (csr_shadow_err is only mtvec_err |
#                           pmp_csr_err | cpuctrlsts_part_err, all from non-
#                           shadow ibex_csr instances with rd_error_o tied low)
#   PCIncrCheck    = 0    → pc_mismatch_alert_o = 1'b0
#   Lockstep       = 0    → lockstep_alert_{major,minor} = 1'b0
#   DbgTriggerEn   = 0    → No debug trigger registers
#   PMPEnable      = 0    → No PMP checking
#   debug_req_i            → Never asserted (no Debug Module agent)
#   fetch_enable_i         → Static (no SoC fetch-enable controller)
# =============================================================================

echo "--- Applying Ibex TCC Coverage Waivers ---"

# ============================================================================
# Safety/Security Alert Block (ibex_top.sv lines 1133-1140)
# ============================================================================
# These aggregate alert outputs OR together sub-signals that are all hardwired
# to 1'b0 in our configuration. The expression tree can never evaluate to 1.
#
# alert_major_internal_o = core_alert_major_internal | lockstep_alert_major_internal
#                        | rf_alert_major_internal   | icache_alert_major_internal
#
# With our config:
#   core_alert_major_internal = rf_ecc_err_comb(=0) | pc_mismatch_alert(=0) | csr_shadow_err(≈0)
#   lockstep_alert_major_internal = 1'b0  (gen_no_lockstep)
#   rf_alert_major_internal       = from register_file_i.err_o (RegFileWrenCheck=0, RdataMuxCheck=0)
#   icache_alert_major_internal   = |icache_tag_alert(=0) | |icache_data_alert(=0) (gen_norams)
# ============================================================================

# --- ibex_top: icache_alert_major_internal = (|icache_tag_alert) | (|icache_data_alert) ---
# Both icache_tag_alert and icache_data_alert are hardwired to '{default:'b0} by gen_norams
coverage exclude -scope /ibex_core_tb_top/dut -code ec -item "*icache_tag_alert*"
coverage exclude -scope /ibex_core_tb_top/dut -code ec -item "*icache_data_alert*"
coverage exclude -scope /ibex_core_tb_top/dut -code ec -item "*icache_alert_major_internal*"

# --- ibex_top: aggregate alert OR expressions ---
# All terms are hardwired to 0, so the full expression is always 0
coverage exclude -scope /ibex_core_tb_top/dut -code ec -item "*alert_major_internal*"
coverage exclude -scope /ibex_core_tb_top/dut -code ec -item "*alert_major_bus*"
coverage exclude -scope /ibex_core_tb_top/dut -code ec -item "*alert_minor*"

# --- ibex_top: lockstep alert signals (gen_no_lockstep hardwires to 0) ---
coverage exclude -scope /ibex_core_tb_top/dut -code ec -item "*lockstep_alert*"

# ============================================================================
# Core Integrity Block (ibex_core.sv lines 964-966)
# ============================================================================
# alert_major_internal_o = rf_ecc_err_comb | pc_mismatch_alert | csr_shadow_err
# alert_major_bus_o      = lsu_load_resp_intg_err | lsu_store_resp_intg_err | instr_intg_err
#
# With our config:
#   rf_ecc_err_comb         = 1'b0  (gen_no_regfile_ecc, RegFileECC=0)
#   pc_mismatch_alert       = 1'b0  (g_no_secure_pc, PCIncrCheck=0)
#   csr_shadow_err          ≈ 0     (ShadowCSR=0 → ibex_csr ShadowCopy=0, rd_error_o tied low)
#   lsu_load_resp_intg_err  = 0     (data_intg_err=0, MemECC=0)
#   lsu_store_resp_intg_err = 0     (data_intg_err=0, MemECC=0)
#   instr_intg_err          = 0     (g_no_mem_ecc in IF stage, MemECC=0)
# ============================================================================

# --- ibex_core: alert output expressions ---
coverage exclude -scope /ibex_core_tb_top/dut/u_ibex_top/u_ibex_core -code ec -item "*rf_ecc_err_comb*"
coverage exclude -scope /ibex_core_tb_top/dut/u_ibex_top/u_ibex_core -code ec -item "*pc_mismatch_alert*"
coverage exclude -scope /ibex_core_tb_top/dut/u_ibex_top/u_ibex_core -code ec -item "*csr_shadow_err*"
coverage exclude -scope /ibex_core_tb_top/dut/u_ibex_top/u_ibex_core -code ec -item "*lsu_load_resp_intg_err*"
coverage exclude -scope /ibex_core_tb_top/dut/u_ibex_top/u_ibex_core -code ec -item "*lsu_store_resp_intg_err*"
coverage exclude -scope /ibex_core_tb_top/dut/u_ibex_top/u_ibex_core -code ec -item "*instr_intg_err*"
coverage exclude -scope /ibex_core_tb_top/dut/u_ibex_top/u_ibex_core -code ec -item "*alert_major_internal*"
coverage exclude -scope /ibex_core_tb_top/dut/u_ibex_top/u_ibex_core -code ec -item "*alert_major_bus*"

# --- LSU: data_intg_err is hardwired to 0 (g_no_mem_data_ecc) ---
coverage exclude -scope /ibex_core_tb_top/dut/u_ibex_top/u_ibex_core/load_store_unit_i -code ec -item "*data_intg_err*"
coverage exclude -scope /ibex_core_tb_top/dut/u_ibex_top/u_ibex_core/load_store_unit_i -code ec -item "*load_resp_intg_err*"
coverage exclude -scope /ibex_core_tb_top/dut/u_ibex_top/u_ibex_core/load_store_unit_i -code ec -item "*store_resp_intg_err*"

# --- IF stage: instr_intg_err is hardwired to 0 (g_no_mem_ecc) ---
coverage exclude -scope /ibex_core_tb_top/dut/u_ibex_top/u_ibex_core/if_stage_i -code ec -item "*instr_intg_err*"

# --- IF stage: pc_mismatch_alert_o hardwired to 0 (g_no_secure_pc) ---
coverage exclude -scope /ibex_core_tb_top/dut/u_ibex_top/u_ibex_core/if_stage_i -code ec -item "*pc_mismatch_alert*"

# --- CS Registers: csr_shadow_err_o (ShadowCSR=0 → all shadow copies disabled) ---
coverage exclude -scope /ibex_core_tb_top/dut/u_ibex_top/u_ibex_core/cs_registers_i -code ec -item "*csr_shadow_err*"

# ============================================================================
# Debug Port & Fetch Enable (Out-of-scope for TCC)
# ============================================================================
# debug_req_i is never asserted — no Debug Module agent in the environment.
# fetch_enable_i is a multi-bit MuBi signal managed by the SoC integration
# layer. Only bit [0] matters for non-secure config (SecureIbex=0).
# ============================================================================

# --- Toggle coverage for uncontrolled pins ---
coverage exclude -scope /ibex_core_tb_top/dut -toggle debug_req_i
coverage exclude -scope /ibex_core_tb_top/dut -toggle fetch_enable_i

# --- Expression/Condition coverage involving debug_req_i ---
coverage exclude -scope /ibex_core_tb_top/dut -code ec -item "*debug_req_i*"

# --- Expression/Condition coverage involving fetch_enable_i ---
coverage exclude -scope /ibex_core_tb_top/dut -code ec -item "*fetch_enable_i*"

# --- Controller: enter_debug_mode_prio_d depends on debug_req_i ---
coverage exclude -scope /ibex_core_tb_top/dut/u_ibex_top/u_ibex_core/id_stage_i/controller_i -code ec -item "*debug_req_i*"
coverage exclude -scope /ibex_core_tb_top/dut/u_ibex_top/u_ibex_core/id_stage_i/controller_i -code ec -item "*enter_debug_mode*"

# ============================================================================
# RVFI Captured NMI/Debug (ibex_core.sv lines 1455-1526)
# ============================================================================
# captured_nmi, captured_debug_req, new_debug_req:
#   - captured_debug_req = debug_req_i → never 1 (no debug agent)
#   - captured_nmi will be covered by the NMI vseq, so we only waive
#     the debug-related capture expressions
#   - new_debug_req = debug_req_i & ~debug_mode → always 0
# ============================================================================

coverage exclude -scope /ibex_core_tb_top/dut/u_ibex_top/u_ibex_core -code ec -item "*captured_debug_req*"
coverage exclude -scope /ibex_core_tb_top/dut/u_ibex_top/u_ibex_core -code ec -item "*new_debug_req*"

# ============================================================================
# Controller Internal NMI (MemECC=0 → irq_nm_int = 1'b0)
# ============================================================================
# The g_no_intg_irq_int generate block hardwires:
#   irq_nm_int       = 1'b0
#   irq_nm_int_cause = 0
#   irq_nm_int_mtval = 0
# So the conditional expressions inside IRQ_TAKEN (line 653):
#   (irq_nm_int & !irq_nm_ext_i) will always be 0
# ============================================================================

coverage exclude -scope /ibex_core_tb_top/dut/u_ibex_top/u_ibex_core/id_stage_i/controller_i -code ec -item "*irq_nm_int*"
coverage exclude -scope /ibex_core_tb_top/dut/u_ibex_top/u_ibex_core/id_stage_i/controller_i -code ec -item "*mem_resp_intg_err*"

echo "--- Coverage Waivers Applied Successfully ---"