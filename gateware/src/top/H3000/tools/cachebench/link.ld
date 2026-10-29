/* The firmware's layout: code and constants in PSRAM, data, bss and the
   stack in the 32 KB block RAM. */
MEMORY {
    blockram : ORIGIN = 0x00000000, LENGTH = 0x00008000
    psram    : ORIGIN = 0x20200000, LENGTH = 0x00500000
}
ENTRY(_start)
SECTIONS {
    .text : { *(.text.start) *(.text .text.*) } > psram
    .rodata : { *(.rodata .rodata.*) *(.srodata .srodata.*) } > psram
    .data : { *(.data .data.*) *(.sdata .sdata.*) } > blockram AT > psram
    .bss (NOLOAD) : { *(.bss .bss.*) *(.sbss .sbss.*) } > blockram
    /DISCARD/ : { *(.eh_frame) }
}
