# Grub multiboot header
# =
# This code defines the multiboot2 header that will be used by grub in order
# to load the kernel correctly.
.code32
.section .multiboot_header, "a" # "a" for correct section permissions
header_start:
  .balign	16
  .long 0xe85250d6 # Header magic number
  .long 0 # Kernel architecture (i386 (32bit x86))
  .long header_end - header_start # Header size
  .long -(0xe85250d6 + 0 + (header_end - header_start)) # Header checksum
  .word 0 # End tag type
  .word 0 # End tag flags
  .long 8 # End tag size
header_end:
