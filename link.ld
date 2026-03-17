OUTPUT_ARCH(riscv)
ENTRY(_start)

SECTIONS
{
    . = 0x00000080;
    
    .text : {
        *(.text.init) 
        *(.text)      
    }
    
    .rodata : { *(.rodata) }
    .data   : { *(.data) }
    .bss    : { *(.bss) }
    
    _end = .;
}
