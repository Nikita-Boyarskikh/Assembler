bits 64
default rel

extern _printf, _scanf
global _main

section .text
_main:
    push rbp
    mov rbp, rsp

    lea rsi, [A]
    call read_long_long

    lea rsi, [B]
    call read_long_long

    mov rdi, [A]
    mov rsi, [B]
    call max

    mov rsi, rax
    call print_long_long

    xor rax, rax
    pop rsi
    ret

max:
    push rbp
    mov rbp, rsp

    cmp rdi, rsi
    jl less
        mov rax, rdi
        jmp continue
    less:
        mov rax, rsi
    continue:

    pop rsi
    ret

read_long_long:
    push rbp
    mov rbp, rsp

    lea rdi, [read_fmt]
    xor rax, rax
    xor al, al
    call _scanf
    mov rax, rsi
    cdq
    mov rsi, rax

    pop rbp
    ret

print_long_long:
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
    fmt db '%lld',10,0
    read_fmt db '%lld'

section .bss
    A resq 1
    B resq 1
