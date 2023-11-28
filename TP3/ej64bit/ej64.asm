section .text
GLOBAL _start
EXTERN suma
_start:
    ;push rbp
    ;mov rbp, rsp
    mov rdi, 4 ;int a
    mov rsi, 3 ;int b
    call suma
    ;mov rsp, rbp
    ;pop rbp
    mov rax, 1
    mov rbx, 0
    int 80h
    ret