section .text
GLOBAL cpu_name

EXTERN printf
cpu_name:
    mov eax, 0x4
    CPUID
    mov eax, edx
    ret