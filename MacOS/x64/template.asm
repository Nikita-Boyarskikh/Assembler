%include 'macro.inc'

bits 64
default rel

extern _printf, _scanf
global _main

section .text
_main:
    push rbp
    mov rbp, rsp

    mov rax, [A]
    add rax, 5
    sub rax, [B]
    mov [X], rax

    mov esi, [X]
    call print_int

    xor rax, rax
    pop rbp
    ret

print_int:
    push rbp
    mov rbp, rsp

    lea rdi, [fmt]
    xor rax, rax
    xor al, al
    call _printf

    xor rax, rax
    pop rbp
    ret

section .data
    A dd -30
    B dd 21
    
    fmt db '%d',10,0

section .bss
    X: resb 1
