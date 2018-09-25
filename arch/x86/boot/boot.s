# Boot sequence followed by grub bootloader
# =
# This code is still running in protected mode that has been enabled after the
# grub bootloader. The long mode will be enabled during the end, before the
# actual kernel will be loaded.
.code32
.globl start

.text
start:
  movl $0x2f4b1f4f, 0xb8000
  hlt
