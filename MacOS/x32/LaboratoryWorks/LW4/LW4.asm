%include 'macro.inc'

global start, _main

section .data
    numberOfColumns dd 3
    numberOfLines dd 6
    prompt db 'Enter matrix %dx%d:',10,0
    result db 'Resulting matrix:',10,0
    readThreeIntsFormat db '%d %d %d',0
    printThreeIntsFormat db '%d %d %d',10,0

section .bss
    MATRIX resd 3 * 6

section .text
start:
_main:
    sub esp, 12

    ; Input
    PRINTF prompt, dword [numberOfLines], dword [numberOfColumns]
    mov ecx, [numberOfLines]
input:
    sub esp, 12
    push ecx

    mov eax, [numberOfLines]
    sub eax, ecx
    imul eax, [numberOfColumns]
    imul eax, 4

    lea ebx, [MATRIX + eax]
    lea ecx, [ebx + 4]
    lea eax, [ecx + 4]
    
    SCANF readThreeIntsFormat, ebx, ecx, eax

    pop ecx
    add esp, 12
    loop input

    ; Calc
    mov ecx, [numberOfLines]
calc:
    sub esp, 12
    push ecx

    mov eax, [numberOfLines]
    sub eax, ecx
    imul eax, [numberOfColumns]
    imul eax, 4

    mov edx, 0 ; sum = 0
    mov ecx, [numberOfColumns]
    loopOverColumns:
        mov ebx, [numberOfColumns]
        sub ebx, ecx
        imul ebx, 4

        mov esi, dword [MATRIX + eax + ebx]
        if: test esi, 1 ; if MATRIX[eax][ebx] % 2 == 0
            jnz endif
            add edx, esi ; sum += MATRIX[eax][ebx]
        endif:
    loop loopOverColumns

test:
    mov dword [MATRIX + eax + 2*4], edx ; MATRIX[eax][2] = sum

    pop ecx
    add esp, 12
    loop calc

    ; Output result
    PRINTF result
    mov ecx, [numberOfLines]
output:
    sub esp, 12
    push ecx

    mov eax, [numberOfLines]
    sub eax, ecx
    imul eax, [numberOfColumns]
    imul eax, 4

    mov ebx, [MATRIX + eax]
    mov ecx, [MATRIX + eax + 4]
    mov edx, [MATRIX + eax + 4*2]
    
    PRINTF printThreeIntsFormat, ebx, ecx, edx

    pop ecx
    add esp, 12
    loop output

    EXIT 0
