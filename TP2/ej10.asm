section .text
GLOBAL _start
EXTERN print
EXTERN num_tostr
EXTERN exit
_start: 
    push ebp 
    mov ebp, esp
    mov eax, dword [ebp + 4]
    dec eax
    push cadena
    call print
    push barraene
    call print
    ;push eax
    ;push placeholder
    ;call num_tostr
    ;call print 
    mov ecx, ebp
    add ecx, 12 ;Pongo en ecx el primer argumento.
.loop:
    cmp eax, 0 ;En eax cargo la cantidad de argumentos y la uso de contador.
    je .fin 
    push dword [ecx] ;En ecx están los argumentos.
    call print 
    push barraene
    call print
    add ecx, 4
    dec eax
    jmp .loop
.fin:
    call exit

section .data
cadena db "Cadena de argumentos: ", 0
barraene db 10, 0
section .bss
placeholder resb 128    
    