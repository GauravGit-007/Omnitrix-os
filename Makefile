# Makefile for Omnitrix OS v2.0
TARGET=kernel.bin
ISO=omnitrix-os.iso

all: $(TARGET) iso

$(TARGET): boot/bootloader.asm kernel/kernel.c linker.ld
	nasm -f elf32 boot/bootloader.asm -o bootloader.o

	i686-elf-gcc -m32 -ffreestanding -c kernel/kernel.c -o kernel.o
	i686-elf-ld -m elf_i386 -T linker.ld bootloader.o kernel.o -o $(TARGET)

iso: $(TARGET)
	mkdir -p iso/boot/grub
	cp $(TARGET) iso/boot/kernel.bin
	echo 'set timeout=0\nset default=0\n\nmenuentry "Omnitrix OS" {\n\tmultiboot /boot/kernel.bin\n\tboot\n}' > iso/boot/grub/grub.cfg
	grub-mkrescue -o $(ISO) iso

run: $(ISO)
	qemu-system-i386 -cdrom $(ISO)

clean:
	rm -rf *.o *.bin iso $(ISO)
