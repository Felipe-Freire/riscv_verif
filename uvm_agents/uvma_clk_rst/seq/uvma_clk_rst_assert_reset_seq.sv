`ifndef __UVMA_CLK_RST_ASSERT_RESET_SEQ_SV__
`define __UVMA_CLK_RST_ASSERT_RESET_SEQ_SV__ 

class uvma_clk_rst_assert_reset_seq extends uvma_clk_rst_base_seq;

  rand int unsigned reset_duration_ps;

  `uvm_object_utils(uvma_clk_rst_assert_reset_seq)

  function new(string name="uvma_clk_rst_assert_reset_seq");
    super.new(name);
  endfunction

  constraint default_reset_duration_cons {
    soft reset_duration_ps == 50000; // 50 ns
  }

  task body();
    uvma_clk_rst_seq_item req;
    
    `uvm_info("CLK_RST_SEQ", "Starting System Reset sequence...", UVM_LOW)

    req = uvma_clk_rst_seq_item::type_id::create("req");
    start_item(req);
    req.action            = UVMA_CLK_RST_SEQ_ITEM_ACTION_ASSERT_RESET;
    req.reset_duration_ps = 50000; // Keep reset at 0 for 50ns (5 cycles)
    finish_item(req);

    `uvm_info("CLK_RST_SEQ", "System Reset applied and released successfully.", UVM_LOW)
  endtask

endclass : uvma_clk_rst_assert_reset_seq

`endif // __UVMA_CLK_RST_ASSERT_RESET_SEQ_SV__
