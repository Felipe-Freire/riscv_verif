# --- Include Paths required for Ibex ---
+incdir+${IBEX_RTL_PATH}

# --- Base Vendor Packages (Must come BEFORE Ibex) ---
${IBEX_RTL_PATH}/../vendor/lowrisc_ip/ip/prim/rtl/prim_util_pkg.sv
${IBEX_RTL_PATH}/../vendor/lowrisc_ip/ip/prim/rtl/prim_mubi_pkg.sv
${IBEX_RTL_PATH}/../vendor/lowrisc_ip/ip/prim/rtl/prim_ram_1p_pkg.sv
${IBEX_RTL_PATH}/../vendor/lowrisc_ip/ip/prim/rtl/prim_assert_standard_macros.svh
${IBEX_RTL_PATH}/../vendor/lowrisc_ip/ip/prim/rtl/prim_assert.sv
${IBEX_RTL_PATH}/../vendor/lowrisc_ip/ip/prim/rtl/prim_secded_pkg.sv

# --- Core Files (In the correct compilation order) ---
${IBEX_RTL_PATH}/ibex_pkg.sv
${IBEX_RTL_PATH}/ibex_alu.sv
${IBEX_RTL_PATH}/ibex_compressed_decoder.sv
${IBEX_RTL_PATH}/ibex_controller.sv
${IBEX_RTL_PATH}/ibex_cs_registers.sv
${IBEX_RTL_PATH}/ibex_counter.sv
${IBEX_RTL_PATH}/ibex_decoder.sv
${IBEX_RTL_PATH}/ibex_ex_block.sv
${IBEX_RTL_PATH}/ibex_id_stage.sv
${IBEX_RTL_PATH}/ibex_if_stage.sv
${IBEX_RTL_PATH}/ibex_load_store_unit.sv
${IBEX_RTL_PATH}/ibex_multdiv_slow.sv
${IBEX_RTL_PATH}/ibex_multdiv_fast.sv
${IBEX_RTL_PATH}/ibex_prefetch_buffer.sv
${IBEX_RTL_PATH}/ibex_fetch_fifo.sv
${IBEX_RTL_PATH}/ibex_register_file_ff.sv
${IBEX_RTL_PATH}/ibex_core.sv

# --- Top Wrappers (Missing from the original file) ---
${IBEX_RTL_PATH}/ibex_top.sv
${IBEX_RTL_PATH}/ibex_top_tracing.sv