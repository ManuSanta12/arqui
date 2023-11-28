section .text
GLOBAL _start
EXTERN print
EXTERN num_tostr
EXTERN exit

EXTERN str_prefix
_start: 
    push ebp 
    mov ebp, esp
    push s2
    mov edx, [ebp+4]
    add eax, 4
    mov ecx, 4 
    mul ecx 
    mov esi, ebp
    add esi, eax
    mov edi, 0

.loop:
    cmp edi, 1 ;edi es mi flag
    je .fin 
    push dword [esi]
    call str_prefix
    pop ecx
    add esi,4
    jmp .loop

.fin:
    push eax
    call print
    mov esp, ebp
    pop ebp
    call exit
section .data   
    s2 db "USER=", 0