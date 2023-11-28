section .text
GLOBAL _start
EXTERN main 
_start:
    push ebp
    mov ebp, esp
    mov eax, ebp
    add eax, 8
    push eax
    push dword [ebp+4]
    call main
    mov ebx, eax
    mov eax, 1
    int 80h
    pop ebp
    ret