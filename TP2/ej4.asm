section .text

GLOBAL _start
EXTERN print
EXTERN num_tostr
EXTERN exit

GLOBAL gauss

_start: 
    push ebp 
    mov ebp, esp
    mov eax, num
    push eax
    push placeholder2
    call gauss 
    push placeholder
    call num_tostr
    call print
    call exit


gauss:
    push ebp
    mov ebp, esp
    push ecx 
    push eax
    mov ecx,[ebp+12]

    mov eax, 0
    .loop:
        cmp ecx, 0
        je .end
        add eax, ecx
        dec ecx
        jmp .loop

    .end:
        mov [ebp+8],eax
        pop eax
        pop ecx
        pop ebp
        ret
section .data 
    num equ 9
section .bss
    placeholder resb 128
    placeholder2 resb 4


