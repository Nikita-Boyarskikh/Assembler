%ifndef IO_INC
%define IO_INC

%include 'macro/defs.inc'

%macro WRITE_LINE 2.nolist
    sub  esp, 4
    push %2
    push %1
    push STDOUT
    mov  eax, SYS_WRITE
    syscall
    add  esp, 16
%endmacro

%macro READ_LINE 2.nolist
    sub     esp, 4
    push    %2
    push    %1
    push    STDIN
    mov     eax, SYS_READ
    syscall
    add     esp, 16
%endmacro

%macro PRINTF 1-*
extern _printf
    %assign stack_alignment (%0 / 4 + 1) * 16
    %assign size (stack_alignment - %0 * 4)
    sub     esp, size
    %rep %0 - 1
        push %{-1:-1}
        %rotate -1
    %endrep
    push    %{-1:-1}
    call    _printf
    add esp, stack_alignment
%endmacro

%macro SCANF 1-*
extern _scanf
    %assign stack_alignment (%0 / 4 + 1) * 16
    %assign size (stack_alignment - %0 * 4)
    sub     esp, size
    %rep %0 - 1
        push %{-1:-1}
        %rotate -1
    %endrep
    push    %{-1:-1}
    call    _scanf
    add     esp, stack_alignment
%endmacro

%macro FFLUSH 1.nolist
extern _fflush
    sub    esp, 12
    push   %1
    call   _fflush
    add    esp, 16
%endmacro

%endif ; IO_INC
