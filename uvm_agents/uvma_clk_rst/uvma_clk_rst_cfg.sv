`ifndef __UVMA_CLK_RST_CFG_SV__
`define __UVMA_CLK_RST_CFG_SV__

class uvma_clk_rst_cfg extends uvm_object;

  rand bit                      enabled;
  rand uvm_active_passive_enum  is_active;
  rand int unsigned             default_period;

  `uvm_object_utils_begin(uvma_clk_rst_cfg)
    `uvm_field_int (enabled, UVM_DEFAULT)
    `uvm_field_enum(uvm_active_passive_enum, is_active, UVM_DEFAULT)
    `uvm_field_int (default_period, UVM_DEFAULT)
  `uvm_object_utils_end

  constraint defaults_cons {
    soft enabled        == 1;
    soft is_active      == UVM_ACTIVE;
    soft default_period == 10000; // 10 ns = 100MHz
  }

  function new(string name="uvma_clk_rst_cfg");
    super.new(name);
  endfunction

endclass : uvma_clk_rst_cfg

`endif // __UVMA_CLK_RST_CFG_SV__
