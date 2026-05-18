# --- Include Paths required for Ibex ---
+incdir+${IBEX_RTL_PATH}

# --- Base Vendor Packages and Primitives ---
${IBEX_RTL_PATH}/../vendor/lowrisc_ip/ip/prim/rtl/prim_util_pkg.sv
${IBEX_RTL_PATH}/../vendor/lowrisc_ip/ip/prim/rtl/prim_mubi_pkg.sv
${IBEX_RTL_PATH}/../vendor/lowrisc_ip/ip/prim/rtl/prim_ram_1p_pkg.sv
${IBEX_RTL_PATH}/../vendor/lowrisc_ip/ip/prim/rtl/prim_assert_standard_macros.svh
${IBEX_RTL_PATH}/../vendor/lowrisc_ip/ip/prim/rtl/prim_assert.sv
${IBEX_RTL_PATH}/../vendor/lowrisc_ip/ip/prim/rtl/prim_secded_pkg.sv
${IBEX_RTL_PATH}/../vendor/lowrisc_ip/ip/prim_generic/rtl/prim_generic_clock_gating.sv
${IBEX_RTL_PATH}/../vendor/lowrisc_ip/ip/prim_generic/rtl/prim_generic_buf.sv


${IBEX_RTL_PATH}/../dv/uvm/core_ibex/common/prim/prim_pkg.sv
${IBEX_RTL_PATH}/../dv/uvm/core_ibex/common/prim/prim_clock_gating.sv
${IBEX_RTL_PATH}/../dv/uvm/core_ibex/common/prim/prim_buf.sv

# --- Core Files ---
${IBEX_RTL_PATH}/ibex_pkg.sv
${IBEX_RTL_PATH}/ibex_alu.sv
${IBEX_RTL_PATH}/ibex_compressed_decoder.sv
${IBEX_RTL_PATH}/ibex_controller.sv
${IBEX_RTL_PATH}/ibex_cs_registers.sv
${IBEX_RTL_PATH}/ibex_csr.sv
${IBEX_RTL_PATH}/ibex_counter.sv
${IBEX_RTL_PATH}/ibex_decoder.sv
${IBEX_RTL_PATH}/ibex_ex_block.sv
${IBEX_RTL_PATH}/ibex_wb_stage.sv
${IBEX_RTL_PATH}/ibex_id_stage.sv
${IBEX_RTL_PATH}/ibex_if_stage.sv
${IBEX_RTL_PATH}/ibex_load_store_unit.sv
${IBEX_RTL_PATH}/ibex_multdiv_slow.sv
${IBEX_RTL_PATH}/ibex_multdiv_fast.sv
${IBEX_RTL_PATH}/ibex_prefetch_buffer.sv
${IBEX_RTL_PATH}/ibex_fetch_fifo.sv
${IBEX_RTL_PATH}/ibex_register_file_ff.sv
${IBEX_RTL_PATH}/ibex_core.sv
${IBEX_RTL_PATH}/ibex_tracer_pkg.sv
${IBEX_RTL_PATH}/ibex_tracer.sv

# --- Top Wrappers ---
${IBEX_RTL_PATH}/ibex_top.sv
${IBEX_RTL_PATH}/ibex_top_tracing.sv