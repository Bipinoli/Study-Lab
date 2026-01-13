; ----------------------------------------------
; Get two ints as input from the user from STDIN
; Add them and output the result to STDOUT
; Written for x86_64 Linux with NASM assembler
; ----------------------------------------------

global _start

section .text

_start:
  mov rsi, prompt_msg 
  mov rdx, prompt_msg_len
  call write

  mov rsi, num1
  mov rdx, 32
  call read_int

  mov r15, rax

  mov rsi, prompt_msg
  mov rdx, prompt_msg_len
  call write

  mov rsi, num2
  mov rdx, 32
  call read_int

  mov r14, rax

  add r15, r14

  mov rax, r15
  mov rsi, result
  mov rdi, 32
  call int_to_ascii

  mov r13, rax ; start of result ascii bytes
  mov r12, r15 ; total number of bytes

  mov rsi, output_msg
  mov rdx, output_msg_len
  call write

  mov rsi, r13
  mov rdx, r12
  call write

  mov rsi, newline
  mov rdx, 1
  call write

  call exit  


; write to stdout
; rsi: pointer to message buffer
; rdx: buffer size
write:
  mov rax, 1 ; write syscall
  mov rdi, 1 ; stdout fd
  syscall
  ret


; converts unsigned integer to ASCII form for stdout
; params:
;   rax: integer
;   rsi: pointer to buffer
;   rdi: buffer size
; output: 
;   rax: pointer to the start of ascii bytes
;   r15: total number of ascii bytes
int_to_ascii:
  lea rsi, [rsi + rdi] ; end of buffer
  mov byte [rsi], 0 ; null terminator
  mov r15, 1
  
  cmp rax, 0
  jne .convert

  ; when the param rax is zero
  dec rsi
  mov byte [rsi], '0'
  mov rax, rsi
  inc r15
  jmp .done

  .convert:
    ; dividend -> rdx:rax
    ; quotient -> rax
    ; remainder -> rdx
    dec rsi
    xor rdx, rdx
    mov rcx, 10
    div rcx
    ; save ascii of remainder
    add rdx, '0'
    mov byte [rsi], dl ; lowest byte of rdx
    inc r15
    cmp rax, 0
    jne .convert
    mov rax, rsi
    jmp .done
    
  .done:
    ret
  

; read integer from stdin
; params:
;   rsi: pointer to buffer
;   rdx: buffer size
; return: rax
read_int:
  mov rax, 0 ; read syscall
  mov rdi, 0 ; stdin fd
  syscall
  
  ; parse buf into int. stop at first non-digit
  xor rax, rax ; retval
  .loop:
    ; rsi points to the buffer
    movzx rcx, byte [rsi]
    ; parse complete if not 0-9
    cmp rcx, '0'
    jb .done
    cmp rcx, '9'
    ja .done
    ; collect digit in retval (n = n * 10 + digit)
    imul rax, rax, 10
    sub rcx, '0'
    add rax, rcx
    ; parse following digits 
    inc rsi
    jmp .loop

  .done:
    ret
  

exit:
  mov rax, 60 ; exit syscall
  xor rdi, rdi
  syscall



section .bss
  num1 resb 32
  num2 resb 32
  result resb 32

section .data
  prompt_msg: db `Please enter an unsigned integer\n`
  prompt_msg_len equ $ - prompt_msg

  output_msg: db `The sum of the integers is\n`
  output_msg_len equ $ - output_msg
  
  newline: db `\n`
