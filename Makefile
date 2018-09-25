# Query architecture details
ARCH ?= $(shell uname -m | head -c3)
BITS ?= 64
CCMARCH ?= native
ASMARCH ?= generic$(BITS)

export BITS CCMARCH ASMARCH

# Define commands
AS = as
CC = gcc
CCFLAGS = -masm=att -m$(BITS) -march=$(CCMARCH) -mtune=$(CCMARCH)
ASFLAGS = -march=$(ASMARCH) -mtune=$(ASMARCH) --$(BITS) -msyntax=att \
					-mmnemonic=att

export AS CC CCFLAGS ASFLAGS

# Define directories
BUILDDIR = build

export BUILDDIR

# Define files
GRUBCFG = arch/$(ARCH)/boot/grub.cfg
IMAGE = $(BUILDDIR)/kern.iso

# Define default task
default: build/$(ARCH).boot.bin

# Import architecture specific makefile
include arch/$(ARCH)/Makefile

# TODO - Combine bootsequence and kernel
KERNEL = $(BOOTSEQUENCE)

# Generate image
image: build/$(ARCH).boot.bin
	mkdir -p $(BUILDDIR)/isofiles/boot/grub
	cp $(KERNEL) $(BUILDDIR)/isofiles/boot/kernel.bin
	cp $(GRUBCFG) $(BUILDDIR)/isofiles/boot/grub
	grub-mkrescue -o $(IMAGE) -d /usr/lib/grub/$(GRUBEXT) $(BUILDDIR)/isofiles

# Clean project
clean:
	rm -r build

.PHONY: clean
