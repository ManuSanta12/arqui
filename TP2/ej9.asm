section .text
GLOBAL _start
EXTERN print
EXTERN num_tostr
EXTERN exit
_start: 
    mov eax, dword [esp]
    dec eax
    push eax
    push placeholder
    call num_tostr
    call print
    call exit

section .bss
  placeholder resb 4