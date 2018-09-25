ENTRY(start)
OUTPUT_FORMAT("elf32-i386", "elf32-i386", "elf32-i386")
OUTPUT_ARCH(i386)

SECTIONS {
  /* Offset to protect other memory areas */
  . = 1M;

  /* Multiboot2 header should be at the beginning */
  .header : { *(.multiboot_header) }
  .text : { *(.text) }
}
