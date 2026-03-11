`ifndef __UVMA_CLK_RST_IF_SV__
`define __UVMA_CLK_RST_IF_SV__

interface uvma_clk_rst_if ();
  timeunit 1ns;
  timeprecision 1ps;

  import uvm_pkg::*;
  
  // Physical signals for the DUT
  logic clk;
  logic reset_n;
   
  // Internal controls (modified by the Driver)
  realtime clk_period_ns = 10.0; // Default 100MHz
  bit      clk_active    = 0;
  int      jitter_pc     = 0;    // Percentage of Jitter (0-100)

  realtime half_period;
  realtime variation;

  // --- Clock Generation ---
  initial begin
    clk = 0;
    wait (clk_active);
    forever begin
      half_period = clk_period_ns / 2.0;
      
      // Simplified Jitter Logic
      if (jitter_pc > 0) begin
        variation = ($urandom_range(0, jitter_pc) / 100.0) * half_period;
        if ($urandom_range(0,1)) half_period += variation;
        else                     half_period -= variation;
      end

      #(half_period * 1ns); 
      
      if (clk_active) clk = ~clk;
      else            clk = 0;
    end
  end
  
  // --- Control Methods (Called by the Driver) ---
  
  function void set_period(realtime period);
    clk_period_ns = period;
  endfunction
  
  function void start_clk();
    clk_active = 1;
  endfunction
  
  function void stop_clk();
    clk_active = 0;
  endfunction
  
  // Blocking task to apply reset
  task assert_reset(realtime duration_ns);
    reset_n <= 0;
    #(duration_ns * 1ns);
    @(negedge clk); // Synchronize to the falling edge of reset
    reset_n <= 1;
  endtask

endinterface : uvma_clk_rst_if

`endif // __UVMA_CLK_RST_IF_SV__
