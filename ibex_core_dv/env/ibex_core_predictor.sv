`ifndef __IBEX_CORE_PREDICTOR_SV__
`define __IBEX_CORE_PREDICTOR_SV__

class ibex_core_predictor extends uvm_component;
  
  `uvm_component_utils(ibex_core_predictor)

  uvm_tlm_analysis_fifo #(uvma_rvfi_seq_item      ) rvfi_fifo;
  uvm_tlm_analysis_fifo #(uvma_simple_mem_seq_item) dmem_fifo;
  uvm_tlm_analysis_fifo #(uvma_rvfi_seq_item      ) imen_fifo;

  // Output port to the Comparator
  uvm_analysis_port #(ibex_core_cosim_verdict) ap;

  chandle spike_handle;

  function new(string name="ibex_core_predictor", uvm_component parent=null);
    super.new(name, parent);
    ap = new("ap", this);

    rvfi_fifo = new("rvfi_fifo", this);
    dmem_fifo = new("dmem_fifo", this);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(chandle)::get(this, "", "spike_handle", spike_handle)) begin
      `uvm_fatal("PREDICTOR", "Spike pointer (spike_handle) not found!")
    end
  endfunction

  virtual task run_phase(uvm_phase phase);
    fork
      run_cosim_dmem();
      run_cosim_rvfi();
    join
  endtask

  task run_cosim_rvfi();
    uvma_rvfi_seq_item t;
    ibex_core_cosim_verdict verdict;
    int step_result, num_errors;

    forever begin
      // Fica bloqueado até o RTL comitar uma instrução
      rvfi_fifo.get(t);

      verdict = ibex_core_cosim_verdict::type_id::create("verdict");
      verdict.rtl_item = t;

      `uvm_info("PREDICTOR_DEBUG", $sformatf("RVFI -> PC_RDATA: 0x%0x | PC_WDATA: 0x%0x | TRAP: %0b | INTR: %0b", t.pc_rdata, t.pc_wdata, t.trap, t.intr), UVM_LOW)

      // Atualiza o estado do Spike com a realidade do RTL
      riscv_cosim_set_nmi(spike_handle, t.ext_nmi);
      riscv_cosim_set_nmi_int(spike_handle, t.ext_nmi_int);
      riscv_cosim_set_mip(spike_handle, t.ext_pre_mip, t.ext_post_mip);
      riscv_cosim_set_debug_req(spike_handle, t.ext_debug_req);
      riscv_cosim_set_mcycle(spike_handle, t.ext_mcycle);

      for (int i=0; i < 10; i++) begin
        riscv_cosim_set_csr(spike_handle, int'(CSR_MHPMCOUNTER3) + i, t.ext_mhpmcounters[i]);
        riscv_cosim_set_csr(spike_handle, int'(CSR_MHPMCOUNTER3H) + i, t.ext_mhpmcountersh[i]);
      end
    
      riscv_cosim_set_ic_scr_key_valid(spike_handle, t.ext_ic_scr_key_valid);

      // Query the C++ oracle. 
      // Se a instrução for de memória, o Spike vai consumir o que a `run_cosim_dmem` enfileirou!
      step_result = riscv_cosim_step(
        spike_handle, 
        t.rd_addr, 
        t.rd_wdata, 
        t.pc_rdata, 
        t.trap, 
        t.ext_rf_wr_suppress 
      );

      verdict.passed = (step_result == 1);

      // On mismatch, collect detailed error evidence
      if (!verdict.passed) begin
        num_errors = riscv_cosim_get_num_errors(spike_handle);
        for (int i = 0; i < num_errors; i++) begin
          verdict.errors.push_back(riscv_cosim_get_error(spike_handle, i));
        end
        riscv_cosim_clear_errors(spike_handle);
      end

      // Send verdict to the Comparator
      ap.write(verdict);
    end
  endtask

  task run_cosim_dmem();
    uvma_simple_mem_seq_item mem_op;
    bit is_store;

    forever begin
      dmem_fifo.get(mem_op); 

      // Converte o seu enum no bit que o Spike espera
      is_store = (mem_op.access_type == UVMA_SIMPLE_MEM_WRITE) ? 1'b1 : 1'b0;

      riscv_cosim_notify_dside_access(
        spike_handle, 
        is_store,
        mem_op.addr,
        mem_op.data, 
        mem_op.be,
        1'b0, // Sem sinal de erro no seu agente, assumimos sucesso
        1'b0, 1'b0, 1'b0, 
        1'b1
      );
    end
  endtask

endclass : ibex_core_predictor

`endif // __IBEX_CORE_PREDICTOR_SV__
