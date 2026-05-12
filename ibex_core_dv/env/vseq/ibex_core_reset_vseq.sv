`ifndef __IBEX_CORE_RESET_VSEQ_SV__
`define __IBEX_CORE_RESET_VSEQ_SV__

/**
 * Class: ibex_core_reset_vseq
 * Virtual sequence to perform boot and randomly reset the core mid-execution.
 */
class ibex_core_reset_vseq extends ibex_core_base_vseq;

  `uvm_object_utils(ibex_core_reset_vseq)

  function new(string name="ibex_core_reset_vseq");
    super.new(name);
  endfunction

  virtual task body();
    ibex_core_boot_vseq           boot_vseq;
    uvma_clk_rst_assert_reset_seq reset_seq;
    int unsigned                  wait_cycles;

    // 1. Executa o Boot normal (liga o clock, tira do reset inicial, liga a memória)
    `uvm_info("RESET_VSEQ", "Executing initial boot sequence...", UVM_LOW)
    boot_vseq = ibex_core_boot_vseq::type_id::create("boot_vseq");
    boot_vseq.start(p_sequencer);

    // 2. Deixa o processador rodar as instruções por um tempo aleatório
    // O teste gera programas longos (+num_of_sub_program=5), então podemos esperar bastante.
    wait_cycles = $urandom_range(2000, 8000);
    `uvm_info("RESET_VSEQ", $sformatf("Waiting %0d clock cycles before mid-flight reset...", wait_cycles), UVM_LOW)
    repeat(wait_cycles) #10ns; // Assumindo período de 10ns

    // 3. Puxa a tomada (Assert Mid-Flight Reset)
    `uvm_info("RESET_VSEQ", "FIRE! Asserting mid-flight system reset!", UVM_LOW)
    `uvm_do_on(reset_seq, p_sequencer.clk_rst_sqr)

    `uvm_info("RESET_VSEQ", "Mid-flight reset sequence finished. Core should be rebooting now...", UVM_LOW)

    // A partir daqui, o UVM Env e o Predictor pegam o evento "reset_e", matam as threads
    // e recriam o Spike silenciosamente. O teste continuará até a nova execução atingir a Signature final.
  endtask

endclass

`endif // __IBEX_CORE_RESET_VSEQ_SV__
