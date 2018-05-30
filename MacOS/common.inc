%use ifunc
%use fp

%include 'macro/common_defs.inc'

%macro ALIGN_STACK 0.nolist
    and esp, -16
%endmacro

%macro NEWLINE 0.nolist
    section .data
        %%new_line db 10
    section .text
        WRITE_LINE %%new_line, 1
%endmacro
