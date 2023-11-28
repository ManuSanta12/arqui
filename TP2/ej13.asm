section .text
GLOBAL _start
EXTERN print
EXTERN num_tostr
EXTERN exit

_start:
    push ebp
    mov ebp, esp
    mov eax, 0x14
    int 80h
    push eax
    push placeholder
    call num_tostr
    call print
    call exit
.fin:
    mov esp, ebp
    pop ebp

section .bss
placeholder resb 128