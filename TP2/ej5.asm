section .text

GLOBAL _start
EXTERN print
EXTERN num_tostr
EXTERN exit
_start: 
    push ebp
    mov ebp, esp
    mov eax, n
    mov ebx, k
    push eax
    push ebx
    call mult
    call exit


mult:  
    push ebp
    mov ebp, esp
    push ebx
    push edx
    mov ebx, [ebp+8];k
    mov eax, [ebp+12];n
    mov edx, eax

    .loop:
        cmp ebx,0
        je .end
        push eax
        push placeholder
        call num_tostr
        mov ecx, placeholder
        push ecx
        call print
        pop ecx
        pop edi
        pop eax
        add eax, edx
        dec ebx
        jmp .loop

    .end:
        ;pop eax
        pop edx
        pop ebx
        pop ebp
        ret

section .data
    n equ 10
    k equ 5

section .bss
    placeholder resb 10