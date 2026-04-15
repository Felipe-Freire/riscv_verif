`ifndef __IBEX_CORE_CNTXT_SV__
`define __IBEX_CORE_CNTXT_SV__

class ibex_core_cntxt extends uvm_object;

  uvma_clk_rst_cntxt    clk_rst_cntxt;
  uvma_simple_mem_cntxt instr_mem_cntxt;
  uvma_simple_mem_cntxt data_mem_cntxt;
  uvma_interrupt_cntxt  interrupt_cntxt;
  uvma_rvfi_cntxt       rvfi_cntxt;
  uvma_isacov_cntxt     isacov_cntxt;

  uvml_mem              shared_mem; // Context can also hold a reference to the shared memory model if needed

  `uvm_object_utils_begin(ibex_core_cntxt)
    `uvm_field_object(clk_rst_cntxt,   UVM_DEFAULT)
    `uvm_field_object(instr_mem_cntxt, UVM_DEFAULT)
    `uvm_field_object(data_mem_cntxt,  UVM_DEFAULT)
    `uvm_field_object(interrupt_cntxt, UVM_DEFAULT)
    `uvm_field_object(rvfi_cntxt,      UVM_DEFAULT)
    `uvm_field_object(isacov_cntxt,    UVM_DEFAULT)
    `uvm_field_object(shared_mem,      UVM_DEFAULT)
  `uvm_object_utils_end

  // Context-specific variables can be declared here
  // For example, if we want to track the current instruction address or data values:
  logic [31:0] current_instr_addr;
  logic [31:0] current_data_addr;
  logic [31:0] current_data_value;

  function new(string name="ibex_core_cntxt");
    super.new(name);

    // Initialize context variables if needed
    clk_rst_cntxt   = uvma_clk_rst_cntxt   ::type_id::create("clk_rst_cntxt"  );
    instr_mem_cntxt = uvma_simple_mem_cntxt::type_id::create("instr_mem_cntxt");
    data_mem_cntxt  = uvma_simple_mem_cntxt::type_id::create("data_mem_cntxt" );
    interrupt_cntxt = uvma_interrupt_cntxt ::type_id::create("interrupt_cntxt");
    rvfi_cntxt      = uvma_rvfi_cntxt      ::type_id::create("rvfi_cntxt"     );
    isacov_cntxt    = uvma_isacov_cntxt    ::type_id::create("isacov_cntxt"   );

    shared_mem      = uvml_mem             ::type_id::create("shared_mem"     );
  endfunction

  // Additional methods for context management can be added here
endclass

`endif // __IBEX_CORE_CNTXT_SV__
