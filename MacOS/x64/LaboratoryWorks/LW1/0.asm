bits 64
default rel

global _main

section .text
_main:
    push rbp
    mov rbp, rsp

    mov rax, [A]
    add rax, 5
    sub rax, [B]
    mov [X], rax

    xor rax, rax
    pop rbp
    ret

section .data
    A dd -30
    B dd 21
    
    fmt db '%d',10,0

section .bss
    X: resb 1
