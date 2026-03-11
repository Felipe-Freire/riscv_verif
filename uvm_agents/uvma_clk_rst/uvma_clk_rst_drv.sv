`ifndef __UVMA_CLK_RST_DRV_SV__
`define __UVMA_CLK_RST_DRV_SV__

class uvma_clk_rst_drv extends uvm_driver #(uvma_clk_rst_seq_item);

  uvma_clk_rst_cfg    cfg;
  uvma_clk_rst_cntxt  cntxt;

  `uvm_component_utils(uvma_clk_rst_drv)

  function new(string name="uvma_clk_rst_drv", uvm_component parent=null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    // Retrieves Handles from the Config DB (dependency injection simulation)
    if(!uvm_config_db#(uvma_clk_rst_cfg)::get(this, "", "cfg", cfg))
      `uvm_fatal("CFG", "No cfg handle")
    if(!uvm_config_db#(uvma_clk_rst_cntxt)::get(this, "", "cntxt", cntxt))
      `uvm_fatal("CNTXT", "No cntxt handle")
  endfunction

  task run_phase(uvm_phase phase);
    forever begin
      seq_item_port.get_next_item(req);
      drive_req(req);
      seq_item_port.item_done();
    end
  endtask

  task drive_req(uvma_clk_rst_seq_item req);
    case (req.action)
      UVMA_CLK_RST_SEQ_ITEM_ACTION_START_CLK: begin
          cntxt.vif.set_period(req.new_period_ps/1000.0); // Convert ps to ns
          cntxt.vif.start_clk();
      end
      UVMA_CLK_RST_SEQ_ITEM_ACTION_STOP_CLK: begin
          cntxt.vif.stop_clk();
      end
      UVMA_CLK_RST_SEQ_ITEM_ACTION_ASSERT_RESET: begin
          cntxt.vif.assert_reset(req.reset_duration_ps/1000.0); // Convert ps to ns
      end
      UVMA_CLK_RST_SEQ_ITEM_ACTION_RESTART_CLK: begin
          cntxt.vif.stop_clk();
          cntxt.vif.start_clk();
      end
    endcase
  endtask

endclass : uvma_clk_rst_drv

`endif // __UVMA_CLK_RST_DRV_SV__
