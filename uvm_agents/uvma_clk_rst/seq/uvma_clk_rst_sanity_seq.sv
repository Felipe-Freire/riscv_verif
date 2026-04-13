`ifndef __UVMA_CLK_RST_SANITY_SEQ_SV__
`define __UVMA_CLK_RST_SANITY_SEQ_SV__

class uvma_clk_rst_sanity_seq extends uvma_clk_rst_base_seq;

  `uvm_object_utils(uvma_clk_rst_sanity_seq)

  function new(string name="uvma_clk_rst_sanity_seq");
    super.new(name);
  endfunction

  task body();
    uvma_clk_rst_seq_item req;
    
    `uvm_info("CLK_RST_SEQ", "Starting initialization sequence (sanity)...", UVM_LOW)

    // --- Step 1: Configure and start the clock ---
    req = uvma_clk_rst_seq_item::type_id::create("req");
    start_item(req);
    req.action        = UVMA_CLK_RST_SEQ_ITEM_ACTION_START_CLK;
    req.new_period_ps = 10000; // 100 MHz
    finish_item(req);

    `uvm_info("CLK_RST_SEQ", "Clock started with 10ns period.", UVM_LOW)

    // --- Step 2: Apply reset ---
    // In real hardware, reset must be held active for a few clock cycles
    req = uvma_clk_rst_seq_item::type_id::create("req");
    start_item(req);
    req.action            = UVMA_CLK_RST_SEQ_ITEM_ACTION_ASSERT_RESET;
    req.reset_duration_ps = 50000; // Keep reset at 0 for 50ns (5 cycles)
    finish_item(req);

    `uvm_info("CLK_RST_SEQ", "Reset applied and released successfully.", UVM_LOW)
    
  endtask

endclass : uvma_clk_rst_sanity_seq

`endif // __UVMA_CLK_RST_SANITY_SEQ_SV__