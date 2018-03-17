bits 64
default rel

extern _printf, _scanf
global _main

section .text
_main:
    push rbp
    mov rbp, rsp

    mov rcx, 10
    xor rax, rax
    counter:
        push rax
        push rcx
        add rax, rcx
        mov rsi, rax
        call print_int
        pop rcx
        pop rax
    loop counter

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
    fmt db '%d',10,0

