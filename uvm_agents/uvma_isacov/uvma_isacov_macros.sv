`ifndef __UVMA_ISACOV_MACROS_SV__
`define __UVMA_ISACOV_MACROS_SV__

`define ISACOV_CP_BITWISE(NAME, SIGNAL, WIDTH) \
  NAME: coverpoint SIGNAL { \
    bins zeros = { {WIDTH{1'b0}} }; \
    bins ones  = { {WIDTH{1'b1}} }; \
    bins mixed = default; \
  }

`endif // __UVMA_ISACOV_MACROS_SV__
