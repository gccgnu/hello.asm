; Filename: hello.asm
; Author: s0lst1c3 (Forked by GCCGNU for x86_64)
; Description: writes "Hello world!" on the screen using only system calls.

global _start

section .data
	msg: db "Hello, World!", 0xA
	msgLen: equ $-msg

section .text
_start:
	; write(STDOUT, "Hello, World", 14)
	mov rax, 1
	mov rdi, 1            ; fd
	mov rsi, msg          ; buf
	mov rdx, msgLen       ; count
	syscall

	; exit(0)
	mov rax, 60           
	xor rdi, rdi          ; exit code
	syscall
