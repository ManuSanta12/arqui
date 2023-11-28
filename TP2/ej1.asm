section .text
global _start
extern print 
extern exit

_start:
    push dword cadena ;pushear constantes de 32 bits, lo mando al stack
    call print ;imprimo la cadena
    ;pop cadena ;me aseguro de borrar lo q hay en el stack, me sirve para situaciones con contrase
    call exit


section .rodata:
cadena db "hello world!", 10, 0 ;32 bits
