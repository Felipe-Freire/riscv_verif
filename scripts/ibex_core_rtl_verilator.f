# --- Verilator-specific additional RTL sources ---
# These vendor packages are needed by ibex_top's sub-hierarchy but are not
# included in the base ibex_core_rtl.f (QuestaSim finds them through +incdir,
# Verilator requires explicit compilation).

# Crypto primitives used by prim_ram_1p_scr (even when ICache scrambling is disabled)
${IBEX_RTL_PATH}/../vendor/lowrisc_ip/ip/prim/rtl/prim_cipher_pkg.sv

# Counter package (prim_count uses prim_count_pkg)
${IBEX_RTL_PATH}/../vendor/lowrisc_ip/ip/prim/rtl/prim_count_pkg.sv
