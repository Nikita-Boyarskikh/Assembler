%include 'macro.inc'

global start, _main

section .data
    promptA db 'Enter A: ',0
    promptJ db 'Enter J: ',0
    promptK db 'Enter K: ',0
    resultFmt db 'Result: %d',10,0
    readIntFormat db '%d',0

section .bss
    A resd 1
    J resd 1
    K resd 1

section .text
start:
_main:
    sub esp, 12

    ; Input A
    PRINTF promptA
    FFLUSH STDOUTF
    SCANF readIntFormat, A

    ; Input J
    PRINTF promptJ
    FFLUSH STDOUTF
    SCANF readIntFormat, J

    ; Input K
    PRINTF promptK
    FFLUSH STDOUTF
    SCANF readIntFormat, K

if:
    cmp  dword [J], 3
    jle  else      ; if j > 3
    mov  ebx, [A]  ; ebx = A
    imul ebx, [J]  ; ebx *= J
    mov  eax, [J]  ; eax = J
    imul eax, [J]  ; eax *= J
    cdq
    idiv dword [K] ; eax /= K
    sub  ebx, eax  ; ebx -= eax
    mov  eax, ebx  ; eax = ebx
    jmp  endif
else:
    mov  eax, 8
endif:
    ; Output result
    PRINTF resultFmt, eax

    EXIT 0
