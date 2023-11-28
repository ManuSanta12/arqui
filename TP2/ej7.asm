section .text
GLOBAL _start
EXTERN print
EXTERN num_tostr
EXTERN exit
_start: 
    push ebp
    mov ebp, esp
    mov eax, array
    push eax
    call lower
    push eax
    push placeholder
    call num_tostr
    call print 
    pop eax 
    call exit

lower: 
    push ebp
    mov ebp, esp
    push ecx
    push ebx
    mov cl, [eax]
    .loop:
        inc eax
        mov bl, [eax]
        cmp bl, -1
        je .end
        cmp cl, bl
        jg .new_min
        jmp .loop

    .new_min:
        mov cl, bl
        jmp .loop

    .end:
        mov eax, ecx
        pop ebx
        pop ecx
        pop ebp
        ret

section .data 
    array db 7, 1, 4, 77, 6, -1

section .bss    
    placeholder resb 4  
