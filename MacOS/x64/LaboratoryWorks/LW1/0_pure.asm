bits 64
default rel

global start

section .text
start:
    mov rax, [A]
    add rax, 5
    sub rax, [B]
    mov [X], rax

; Инициализированная память находятся в секции data
section .data
; dq - qword
    A dq -30
    B dq 21

; Неиницализированная - в bss
; res : reserve - выделить память
; q : qword
; 1 : количество 
section .bss
    X: resq 1
