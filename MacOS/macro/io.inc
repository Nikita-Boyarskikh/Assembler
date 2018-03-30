%ifndef IO_INC
%define IO_INC

%include 'macro/defs.inc'

%macro WRITE_LINE 2.nolist
    mov  eax, dword %2
    inc  eax           ; for carrage return
    push eax
    push dword %1
    push dword STDOUT
    mov  eax, SYS_WRITE
    sub  esp, 4
    syscall
    add  esp, 16
%endmacro

%macro READ_LINE 2.nolist
    push    dword %2
    push    dword %1
    push    dword STDIN
    mov     eax, SYS_READ
    sub     esp, 4
    syscall
    add     esp, 16
%endmacro

%macro NEWLINE 0.nolist
    section .data
        new_line db 10
    section .text
        WRITE_LINE new_line, 1
%endmacro

%endif ; IO_INC
