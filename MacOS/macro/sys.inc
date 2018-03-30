%ifndef SYS_INC
%define SYS_INC

%macro EXIT 1.nolist
    push %1
    sub  esp, 4
    mov  eax, SYS_EXIT
    syscall
%endmacro

%endif ; SYS_INC
