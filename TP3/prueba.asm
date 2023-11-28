section .text
GLOBAL _start
_start:
push ebp
mov ebp, esp 
mov eax, 4
mov ecx, cadena
mov edx, len
mov ebx, 1
int 80h
pop ebp
mov eax, 1
mov ebx, 0
int 80h


section .data
cadena db "holis", 10
len equ $-cadena