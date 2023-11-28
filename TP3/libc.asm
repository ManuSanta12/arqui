section .text
GLOBAL close
GLOBAL read_file
close:
    push ebp
    mov ebp, esp
    mov eax, 1
    mov ebx, dword [ebp+8] ;La función va a recibir como argumento lo que quiero retornar
    int 80h
    pop ebp
    ret
read_file:
    push ebp
    mov ebp, esp
    mov eax, 3
    mov ebx, dword [ebp+8] ;De donde leer
    mov ecx, buff 
    mov edx, 200
    int 80h
    mov eax, ecx
    mov esp, ebp
    pop ebp
    ret

section .bss
    buff resb 300

    