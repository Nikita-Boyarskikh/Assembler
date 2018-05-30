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

%macro PRINTF 2.nolist
extern _printf
    mov rsi, %1
    mov rdi, %2
    xor rax, rax
    call _printf
%endmacro

%macro SCANF 2.nolist
extern _scanf
    mov rsi, %1
    mov rdi, %2
    xor rax, rax
    call _scanf
%endmacro

%endif ; IO_INC
