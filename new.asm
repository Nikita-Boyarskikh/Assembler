%define SYS_EXIT 1 ; Выход из программы
%define SYS_READ 3 ; Ввод данных
%define SYS_WRITE 4 ; Вывод данных

%define STDOUT 1
%define STDIN 0

section .text
    global _start

_start:

    mov eax, SYS_WRITE    ; 'write' syscall
    mov ebx, STDOUT    ; дескриптор файла = 1 (stdout)
    mov ecx, message; указатель на строку 
    mov edx, len; длина строки
    int 0x80     ; вывести приглашение к вводу 

    mov eax, SYS_READ    ; 'read' syscall
    mov ebx, STDIN    ; дескриптор файла = 0 (stdin)
    mov ecx, buff; указатель на буфер
    mov edx, 2; макс. длина 
    int 0x80 ; выполнить ввод 

    mov eax, SYS_WRITE; 'write' syscall
    mov ebx, STDOUT ; дескриптор файла = 1 (stdout)
    int 0x80 ; вывести число

    mov eax, SYS_EXIT
    mov ebx, 1
    int 0x80 ; завершение программы

section .data ; сегмент данных 
    message db "Введите шестнадцатеричное число (0-F): "
    len equ $ - message

section .bss ; сегмент стека
    buff resb 2
    buff2 resb 2
    res resb 1
