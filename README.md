# Omnitrix OS

**Omnitrix OS** is a minimal operating system built from scratch using:
- A custom bootloader (Assembly)
- A simple kernel (C)
- GRUB Multiboot
- Cross-compiled with `i686-elf-gcc`
- Runs on QEMU

## 🖥️ Features

- Custom bootloader using NASM
- 32-bit C kernel with multiboot header
- Displays "Welcome to Omnitrix OS" on boot
- Clean grey UI placeholder for future development

## 🛠️ Build Instructions

> You must have WSL or Linux, `nasm`, `i686-elf-gcc`, `qemu`, and `make` installed.

```bash
make clean
make
make run
 
FOLDER STRUCTUCTURE

OmnitrixOS-Git/
├── boot/              # Bootloader code
├── kernel/            # C Kernel
├── iso/               # GRUB bootable ISO setup
├── linker.ld          # Linker script
├── Makefile           # Build script
└── README.md          # Project description

