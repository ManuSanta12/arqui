section .text

GLOBAL _start
EXTERN print
EXTERN num_tostr
EXTERN exit
_start: 
    push ebp
    mov ebp, esp
    mov eax, num
    push eax
    push resp
    call fact
    push placeholder
    call num_tostr
    call print 
    pop eax
    call exit


fact:
    push ebp
    mov ebp, esp
    push ebx
    mov ebx, [ebp+12]
    push eax
    mov eax, 1
    .loop:
        cmp ebx,1
        je .end
        mul ebx
        dec ebx
        jmp .loop
    .end:
        mov [ebp+8], eax
        pop eax
        pop ebx 
        pop ebp
        ret


section .data 
    num equ 5

section .bss 
    placeholder resb 4
    resp resb 4