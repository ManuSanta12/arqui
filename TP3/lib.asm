GLOBAL print
GLOBAL exit
GLOBAL capitalize
GLOBAL str_prefix
GLOBAL num_tostr
print:
    push ebp
    mov ebp, esp
    push ecx 
    push edx
    push eax
    push ebx

    call strlen ; me deja en eax el largo de la cadena 
    mov ecx, [ebp+8] ; en ecx dejo la cadena 
    mov edx, eax ; dejo la longitud en edx

    mov ebx, 1
    mov eax, 4
    int 80h ;las instrucciones para imprimir

    pop ebx
    pop eax
    pop edx
    pop ecx
    pop ebp
    ret

strlen:
    push ebp            ;armo el stack
    mov ebp, esp
    push ecx            ;pusheo los registros que voy a modificar
    push ebx
    mov ebx, [ebp+32]
    ;no pusheo eax(que tiene dentro a al) pues ahi es donde voy a devolver la longitud

    mov ecx, 0          ;contador en 0
    .loop:
        mov al, [ebx]   ;en AL (1 byte) pongo el valor apuntado por ebx
        cmp al, 0       ;comparo AL con 0
        jz .fin         ;si es 0 salto a fin
        inc ecx         ;incremento contador
        inc ebx         ;muevo al siguiente caracter de la cadena
        jmp .loop
    .fin:
        mov eax, ecx    ;pongo en eax la longitud de la cadena

    pop ebx             ;popeo los registros que modifique
    pop ecx
    pop ebp
    ret

exit:
    push ebp        ;armo el stack
    mov ebp, esp
    push eax
    push ebx

    mov eax, 1      ;system call a EXIT
    mov ebx, 0
    int 80h

    pop ebx
    pop eax
    pop ebp
    ret


capitalize:
    push ebp 
    mov ebp, esp
    push ecx
    push ebx

    mov ecx, [ebp + 8]
    
    .loop:
        mov bl, [ecx]
        cmp bl, 0
        je .fin

        cmp bl, 'a'
        jl .incr

        cmp bl, 'z'
        jg .incr

        sub bl, 20h
        mov [ecx], bl
    .incr:
        inc ecx
        jmp .loop
    
    .fin:
        pop ebx
        pop ecx
        pop ebp
        ret

num_tostr:
    push ebp
    mov ebp, esp
    push ecx
    push edx
    push eax

    mov eax, [ebp+12] ;Guarda el numero en eax
    mov ecx, 10 ;Para dividir
    push 0 ;Marca el final del numero

    mov edx, 0 ;En edx se guarda el resto de la división
    cmp eax, 0 ;Si el número es 0, lo imprime directo
    je .to_char

    .loop:
        mov edx, 0
        cmp eax, 0 ;Veo si terminó el número
        je .string
        div ecx 
        jmp .to_char
    .to_char:
        add edx, '0'
        push edx ;Voy pusheando los char
        jmp .loop
    .string:
        mov ecx, [ebp+8] ;Lugar de memoria para dejar el string
        .loop2:
            pop eax
            cmp eax,0
            je .fin
            mov[ecx], al
            inc ecx
            jmp .loop2
    .fin:
        mov[ecx], byte 10
        inc ecx
        mov[ecx], byte 0
        pop eax
        pop edx
        pop ecx
        mov esp, ebp
        pop ebp
        ret


str_prefix:
    push ebp
    mov ebp, esp

    mov eax, dword [ebp+8] ;lo hay q en el stack
    mov ebx, dword [ebp+12] ;"USER=" PARA EL STRLEN
    mov edi, 0 ;flag de encontrado
.loop:  
    cmp dword [ebx], 0 ;"USER=" termino
    je .fin2
    mov dl, byte [eax] ;caracter del stack
    cmp dl, byte [ebx] ;comparo letra con letra
    jz .continue
    jnz .fin
.continue:
    inc eax
    inc ebx
    jmp .loop
.fin2: ;lo encontre
    mov edi, 1
.fin:  ;no lo encontre o me fui
    mov esp, ebp
    pop ebp
    ret