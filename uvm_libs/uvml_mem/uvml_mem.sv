`ifndef __UVML_MEM_SV__
`define __UVML_MEM_SV__

localparam int XLEN = `UVML_MEM_XLEN;

class uvml_mem extends uvm_object;
  
  `uvm_object_utils(uvml_mem)

  protected logic [7:0] content [bit[XLEN-1:0]];

  // Default response value (for unwritten memory areas)
  rand bit [7:0] default_val;

  function new(string name="uvml_mem");
    super.new(name);
  endfunction

  // Write Byte
  function void write_byte(bit [XLEN-1:0] addr, logic [7:0] data);
    content[addr] = data;
  endfunction

  // Read Byte (with empty memory handling)
  function logic [7:0] read_byte(bit [XLEN-1:0] addr);
    if (content.exists(addr)) begin
      return content[addr];
    end else begin
      return default_val; // Returns garbage or zero if not present
    end
  endfunction

  // Helper: Write Word (32 bits - Little Endian for RISC-V)
  function void write_word(bit [XLEN-1:0] addr, logic [31:0] data);
    write_byte(addr + 0, data[7:0]);
    write_byte(addr + 1, data[15:8]);
    write_byte(addr + 2, data[23:16]);
    write_byte(addr + 3, data[31:24]);
  endfunction

  // Helper: Read Word (32 bits - Little Endian)
  function logic [XLEN-1:0] read_word(bit [XLEN-1:0] addr);
    logic [7:0] b0, b1, b2, b3;
    b0 = read_byte(addr + 0);
    b1 = read_byte(addr + 1);
    b2 = read_byte(addr + 2);
    b3 = read_byte(addr + 3);
    return {b3, b2, b1, b0};
  endfunction

  // File Load (Backdoor Load) - Vital for riscv-dv
  function void load_hex(string filename);
    string error_msg;
    int file = $fopen(filename, "r");
    int error = $ferror(file, error_msg);
    string token;
    int code;
    bit [XLEN-1:0] current_addr = 0;
    logic [7:0] byte_val;

    if (error != 0) begin
      `uvm_error("MEM", $sformatf("Failed to open memory file %s with error: %s", filename, error_msg))
      return;
    end else begin
      // Custom sparse hex parser to safely load into an associative array
      while (!$feof(file)) begin
        code = $fscanf(file, "%s", token);
        if (code > 0) begin
          if (token[0] == "@") begin
            token = token.substr(1, token.len() - 1);
            // void'($sscanf(token, "%h", current_addr));
            code = $sscanf(token, "%h", current_addr);
          end else begin
            code = $sscanf(token, "%h", byte_val);
            if (code == 1) begin
              content[current_addr] = byte_val; // Direct write to associative array
              current_addr++;
            end
          end
        end
      end
      $fclose(file);
      `uvm_info("MEM", $sformatf("Loaded memory content from file: %s", filename), UVM_LOW)
    end
  endfunction

  // Backdoor Access for Testbench Components
  function void get_backdoor_memory(ref reg [7:0] mem_copy [bit[XLEN-1:0]]);
    mem_copy = this.content;
  endfunction

  // Clear Memory Content
  function void clear();
    content.delete();
  endfunction

endclass : uvml_mem

`endif
