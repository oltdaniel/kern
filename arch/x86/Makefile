# Set architecture details
ARCH = x86
GRUBEXT = i386-pc

# Specify files
BOOTSEQUENCE = $(BUILDDIR)/$(ARCH).boot.bin
BOOTLINKERSCRIPT = arch/$(ARCH)/boot/linker.ld

# Get source/target files
ASMSOURCES = $(wildcard arch/$(ARCH)/*.s)
ASMOBJECTS = $(patsubst arch/$(ARCH)/%.s,  \
	$(BUILDDIR)/arch/$(ARCH)/%.o, $(ASMSOURCES))
ASMBOOTSOURCES = $(wildcard arch/$(ARCH)/boot/*.s)
ASMBOOTOBJECTS = $(patsubst arch/$(ARCH)/boot/%.s, \
	$(BUILDDIR)/arch/$(ARCH)/boot/%.o, $(ASMBOOTSOURCES))
CCSOURCES = $(wildcard arch/$(ARCH)/*.c)
CCOBJECTS = $(patsubst arch/$(ARCH)/%.c, \
	$(BUILDDIR)/arch/$(ARCH)/%.o, $(CCSOURCES))

# Define commands
ASFLAGSBOOT = -march=i386 -mtune=i386 --32 -msyntax=att -mmnemonic=att

# Compile the boot sequence
$(BOOTSEQUENCE): $(ASMBOOTOBJECTS)
	ld -n -o $(BOOTSEQUENCE) -T $(BOOTLINKERSCRIPT) -m elf_i386 --build-id=none $(ASMBOOTOBJECTS)

# Compile boot assembly files
$(BUILDDIR)/arch/$(ARCH)/boot/%.o: arch/$(ARCH)/boot/%.s
	mkdir -p $(BUILDDIR)/arch/$(ARCH)/boot
	$(AS) $(ASFLAGSBOOT) -o $@ $<

# Compile general assembly files
$(BUILDDIR)/arch/$(ARCH)/%.o: arch/$(ARCH)/%.s
	mkdir -p $(BUILDDIR)/arch/$(ARCH)
	$(AS) $(ASFLAGS) -o $@ $<

# Compile general c files
$(BUILDDIR)/arch/$(ARCH)/%.o: arch/$(ARCH)/%.c
	mkdir -p $(BUILDDIR)/arch/$(ARCH)
	$(CC) $(CCFLAGS) -o $@ $<
