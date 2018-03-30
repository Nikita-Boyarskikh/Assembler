%ifndef SYS_INC
%define SYS_INC

%macro EXIT 1.nolist
    mov rax, SYS_EXIT
    mov rdi, %1
    syscall
%endmacro

%endif ; SYS_INC
