; Объявляем макросы для компилятора

; Номера системных вызовов
%define SYS_EXIT 1 ; Выход из программы
%define SYS_READ 3 ; Ввод данных
%define SYS_WRITE 4 ; Вывод данных

; Номера потоков
%define STDOUT 1 ; Стандартный поток вывода
%define STDIN 0 ; Стандартный поток ввода 

; Секция кода (можно писать segment)
section .text
    global _start ; Объявление глобальной функции _start, являющейся точкой входа

_start: ; Описание _start (точка входа)

; Выводим сообщение о вводе первого числа на экран
    mov edx, len1 ; Помещаем длину сообщения в регистр
    mov ecx, prompt1 ; Помещаем адрес начала сообщения в памяти в регистр
    mov ebx, STDOUT ; Помещаем в регистр номер потока, в который пишем
    mov eax, SYS_WRITE ; Помещаем в регистр номер системного вызова
    int 0x80 ; делаем вызов ядра

; Вводим с STDIN первое число
    mov edx, 2
    mov ecx, num1
    mov ebx, STDIN
    mov eax, SYS_READ
    int 0x80

; Выводим сообщение о вводе второго числа на экран
    mov edx, len2
    mov ecx, prompt2
    mov ebx, STDOUT
    mov eax, SYS_WRITE
    int 0x80

; Вводим с STDIN второе число
    mov edx, 2
    mov ecx, num2
    mov ebx, STDIN
    mov eax, SYS_READ
    int 0x80

; Выводим первое число на экран
    mov edx, 1
    mov ecx, num1
    mov ebx, STDOUT
    mov eax, SYS_WRITE
    int 0x80

; Выводим плюс на экран
    mov edx, lenPlus
    mov ecx, plus
    mov ebx, STDOUT
    mov eax, SYS_WRITE
    int 0x80

; Выводим второе число на экран
    mov edx, 1
    mov ecx, num2
    mov ebx, STDOUT
    mov eax, SYS_WRITE
    int 0x80

; Выводим равно на экран
    mov edx, lenEqual
    mov ecx, equal
    mov ebx, STDOUT
    mov eax, SYS_WRITE
    int 0x80

; Вычисляем сумму двух чисел
    ; Помещаем значение байта по адресу num1 в регистр
    mov eax, [num1] ; Помещаем первый элемент (число) в регистр
    sub eax, '0' ; Приводим к числовому представлению
    mov ebx, [num2] ; Помещаем первый элемент (число) в регистр
    sub ebx, '0' ; Приводим к числовому представлению
    add eax, ebx ; Производим сложение
    add eax, '0' ; Приводим обратно к символьному представлению

; Сохраняем результат в память
    mov [res], eax

; Выводим результат на экран
    mov edx, 1
    mov ecx, res
    mov ebx, STDOUT
    mov eax, SYS_WRITE
    int 0x80

; Переводим строку
    mov edx, 1
    mov ecx, new_str
    mov ebx, STDOUT
    mov eax, SYS_WRITE
    int 0x80

; Выходим из программы
    mov eax, SYS_EXIT
    xor ebx, ebx
    int 0x80

; Секция данных (инициализированных переменных)
section .data
    prompt1 db 'Please, enter 1st number > ' ; Резервируем байтовый массив prompt1 и инициализируем его строкой
    len1 equ $-prompt1 ; Резервируем память и вычисляем длину массива prompt1

    prompt2 db 'Please, enter 2nd number > ' ; Резервируем байтовый массив prompt2 и инициализируем его строкой
    len2 equ $-prompt2 ; Резервируем память и вычисляем длину массива prompt2

    plus db ' + ' ; Резервируем байтовый массив plus и инициализируем его строкой
    lenPlus equ $-plus ; Резервируем память и вычисляем длину массива plus

    equal db ' = ' ; Резервируем байтовый массив equal и инициализируем его строкой
    lenEqual equ $-equal ; Резервируем память и вычисляем длину массива equal

    new_str db 0xA ; 0xA - символ перевода строки, 0xD - символ возврата каретки

; Секция неинициализированных переменных
section .bss
    num1 resb 2 ; Зарезервировать 2 байта под переменную num1
    num2 resb 2 ; Зарезервировать 2 байта под переменную num2
    res resb 1 ; Зарезервировать 1 байт под результат