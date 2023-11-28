section .text

GLOBAL _start
EXTERN print
EXTERN capitalize
EXTERN exit

_start:
    push ebp
    mov ebp, esp

    push dword cadena 
    call capitalize
    call print 
    
    pop ebp
    call exit
    
section .data
cadena db "h4ppy c0d1ng", 10, 0 