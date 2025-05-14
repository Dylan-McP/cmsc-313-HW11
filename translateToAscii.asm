;; Translating Bytes of Data to ASCII Characters
;; Dylan McPhillips - CMSC 313 Section 05 (1430)
;; To assemble: nasm -f elf32 -g -F dwarf -o translateToAscii.o translateToAscii.asm
;; To link and load: ld -m elf_i386 -o translateToAscii translateToAscii.o
;; To run: ./translateToAscii
SECTION .data

inputBuf:
	db 	0x83,0x6A,0x88,0xDE,0x9A,0xC3,0x54,0x9A

numOfBytes:
	dd 	8


SECTION .bss

outputBuf:
	resb 	80

	
SECTION .text
global _start


_start:
	mov 	eax, 0		
	mov 	esi, 0
	mov	edi, 0
translate:
	inc 	esi			

	mov	eax, [inputBuf + esi] ; incrementally get the character in inputBuf
	add	eax, 30
	mov	[outputBuf + edi], eax
	add	edi, numOfBytes
	
	cmp 	esi, 8		; seeing if every member of inputBuf has been translated
	jne 	translate	
	
	mov	esi, 0		; reset loop variables for printing
	mov	edi, 0
	
	mov	edx, numOfBytes		; print the contents of the outputBuf
	mov	ecx, outputBuf	
	mov	ebx, 1
	mov	eax, 4
	int 	80h
	
	mov	ebx, 0
	mov 	eax, 1		; invoke SYS_EXIT
	int 	80h
