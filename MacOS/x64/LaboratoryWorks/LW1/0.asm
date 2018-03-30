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
    A dq -30
    B dq 21

section .bss
    X: resq 1
