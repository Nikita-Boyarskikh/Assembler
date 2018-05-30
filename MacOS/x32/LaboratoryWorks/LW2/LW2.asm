%include 'macro.inc'

global start, _main

section .data
    promptA db 'Enter A: ',0
    promptX db 'Enter X: ',0
    promptB db 'Enter B: ',0
    resultFmt db 'Result: %d',10,0
    readIntFormat db '%d',0

section .bss
    A resd 1
    X resd 1
    B resd 1

section .text
start:
_main:
    sub esp, 12

    ; Input A
    PRINTF promptA
    FFLUSH STDOUTF
    SCANF readIntFormat, A

    ; Input X
    PRINTF promptX
    FFLUSH STDOUTF
    SCANF readIntFormat, X

    ; Input B
    PRINTF promptB
    FFLUSH STDOUTF
    SCANF readIntFormat, B

calc:
    ; 3*a*x/[5*(b-5)]
    mov ecx, [B]
    sub ecx, 5       ; ecx = B - 5
    imul ebx, ecx, 5 ; ebx = ecx * 5
    imul eax, [A], 3 ; eax = A * 3
    imul eax, [X]    ; eax *= X
    cdq
    idiv ebx         ; eax /= ebx
    
    ; Output result
    PRINTF resultFmt, eax

    EXIT 0
