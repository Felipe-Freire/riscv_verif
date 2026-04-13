`ifndef __UVMA_INTERRUPT_DRV_SV__
`define __UVMA_INTERRUPT_DRV_SV__  

class uvma_interrupt_drv extends uvm_driver#(uvma_interrupt_seq_item);
   `uvm_component_utils(uvma_interrupt_drv)

   uvma_interrupt_cfg   cfg;
   uvma_interrupt_cntxt cntxt;

   function new(string name="uvma_interrupt_drv", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   virtual function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      if (!uvm_config_db#(uvma_interrupt_cfg)::get(this, "", "cfg", cfg))
         `uvm_fatal("CFG", "Configuration handle is null")
      
      if (!uvm_config_db#(uvma_interrupt_cntxt)::get(this, "", "cntxt", cntxt))
         `uvm_fatal("CNTXT", "Context handle is null")
   endfunction

   virtual task run_phase(uvm_phase phase);
      super.run_phase(phase);
      
      // Inicializa os pinos todos zerados
      cntxt.vif.drv_cb.irq_vector <= 32'b0;

      forever begin
        seq_item_port.get_next_item(req);
        drv_req(req);
        seq_item_port.item_done();
    end
   endtask

   task drv_req(uvma_interrupt_seq_item req);
      `uvm_info("IRQ_DRV", $sformatf("Driving:\n%s", req.sprint()), UVM_HIGH);
      
      case (req.action)
         UVMA_INTERRUPT_SEQ_ITEM_ACTION_ASSERT: begin
            for (int i = 0; i < 32; i++) begin
               if (req.irq_mask[i]) begin
                  automatic int ii = i;
                  fork
                     assert_irq(ii, req.skew[ii]);
                  join_none
               end
            end
            wait fork; // Espera todos os forks terminarem (os skews)
         end
         
         UVMA_INTERRUPT_SEQ_ITEM_ACTION_DEASSERT: begin
            for (int i = 0; i < 32; i++) begin
               if (req.irq_mask[i]) begin
                  automatic int ii = i;
                  fork
                     deassert_irq(ii, req.skew[ii]);
                  join_none
               end
            end
            wait fork;
         end
      endcase
   endtask

   task assert_irq(int unsigned index, int unsigned skew);
      repeat (skew) @(cntxt.vif.drv_cb);
      cntxt.vif.drv_cb.irq_vector[index] <= 1'b1;
      `uvm_info("IRQ_DRV", $sformatf("Asserted IRQ bit %0d", index), UVM_HIGH);
   endtask

   task deassert_irq(int unsigned index, int unsigned skew);
      repeat (skew) @(cntxt.vif.drv_cb);
      cntxt.vif.drv_cb.irq_vector[index] <= 1'b0;
      `uvm_info("IRQ_DRV", $sformatf("Deasserted IRQ bit %0d", index), UVM_HIGH);
   endtask

endclass : uvma_interrupt_drv

`endif // __UVMA_INTERRUPT_DRV_SV__

