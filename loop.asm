section .text
    global _start
_start:
    mov ecx, 9
    mov [num], byte 0
lo:
    mov eax, 4
    mov ebx, 1
    push ecx
    mov ecx, [num]
    inc ecx
    mov [num], ecx
    add [num], byte '0'
    mov ecx, num
    mov edx, 1
    int 0x80
    sub [num], byte '0'
    pop ecx
    loop lo

mov eax, 4
mov ebx, 1
mov ecx, new_str
mov edx, 1
int 0x80

mov eax, 1
mov ebx, 0
int 0x80

section .data
    new_str db 0xA

section .bss
    num resb 1
