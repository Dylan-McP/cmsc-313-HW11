To assemble: nasm -f elf32 -g -F dwarf -o translateToAscii.o translateToAscii.asm

To link and load: ld -m elf_i386 -o translateToAscii translateToAscii.o

To run: ./translateToAscii
