OUTPUT_ARCH( "riscv" )
ENTRY(_start)

SECTIONS
{
  . = 0x80000000;
  .text.init : { *(.text.init) }
  . = ALIGN(0x1000);
  .tohost : { *(.tohost) }
  . = ALIGN(0x1000);
  .text : { *(.text) }
  . = ALIGN(0x1000);
  .data : { *(.data) }
  .bss : { *(.bss) }
  . = ALIGN(0x1000);
  .region_0 : { *(.region_0) }
  . = ALIGN(0x1000);
  .region_1 : { *(.region_1) }
  . = ALIGN(0x1000);
  .user_stack : { *(.user_stack) }
  . = ALIGN(0x1000);
  .kernel_stack : { *(.kernel_stack) }
  . = ALIGN(0x1000);
  .page_table : { *(.page_table) }
  _end = .;
}
