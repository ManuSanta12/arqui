section .text
GLOBAL _start
EXTERN print
EXTERN num_tostr
EXTERN exit

_start:
    push ebp
    mov ebp, esp
    mov eax, 0x02
    int 80h
    cmp eax, 0 ;Si eax es 0, estoy en el child process, sino retorna -1
    je .child_process
    jmp .parent_process

.fin:
    mov esp, ebp
    pop ebp
    call exit

.child_process:
    push hijo
    call print 
    jmp .fin

.parent_process:
    push padre 
    call print
    jmp .fin

section .rodata
    padre db "soy el padre", 10, 0
    hijo db "soy el hijo", 10, 0

