;main.asm
GLOBAL main
EXTERN printf

section .text
main:
push ebp
mov ebp, esp
;Armado de stack frame
;
push dword [ebp+8]
push fmt
call printf
add esp, 2*4
mov eax, 0
mov esp, ebp
pop ebp
section .rodata
fmt db "Cantidad de argumentos: %d\n", 0
ret