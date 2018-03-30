%ifndef IO_INC
%define IO_INC

%include 'macro/defs64.inc'

%macro READ_LINE 2.nolist
    mov     rax, SYS_READ
    mov     rdi, STDIN
    mov     rsi, qword %1
    mov     rdx, %2
    inc     rdx
    syscall
%endmacro

%macro WRITE_LINE 2.nolist
    mov  rax, SYS_WRITE
    mov  rdi, STDOUT
    mov  rsi, %1
    mov  rdx, %2
    syscall
%endmacro

%macro NEWLINE 0.nolist
    section .data
        new_line db 10
    section .text
        WRITE_LINE new_line, 1
%endmacro

%endif ; IO_INC
