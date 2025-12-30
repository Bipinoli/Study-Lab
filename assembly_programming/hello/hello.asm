; -------------------------------------------------
; Writes "Hello, World" to the stdout using syscall
; Only works on x86_64 Linux
; Written for NASM assembler
; -------------------------------------------------

global _start

section .text

_start: 
  ; https://www.chromium.org/chromium-os/developer-library/reference/linux-constants/syscalls/#x86_64-64-bit
  mov rax, 1 ; write syscall
	mov rdi, 1 ; fd = 1 => stdout
	mov rsi, message 
	mov rdx, length
	syscall
	mov rax, 60
	xor rdi, rdi
	syscall

section .data
  message: db `Hello, World\n`
  length equ $ - message
