section .text
GLOBAL _start
EXTERN print
EXTERN num_tostr
EXTERN exit

_start:
    push ebp
    mov ebp, esp
    push time
    mov eax, 0xa2
    mov ebx, [ebp-4]
    mov ecx, 0
    int 80h
    mov esp, ebp
    pop ebp
    call exit
section .rodata
    time dd 5