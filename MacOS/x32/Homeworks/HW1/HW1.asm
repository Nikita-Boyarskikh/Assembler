%include 'macro.inc'

global start, _main

section .data
    prompt db 'Enter string: ',0
    resultFmt db 'Result: %s',0
    readLineFormat db '%[^\n\0]',0

section .bss
    string resb 30

section .text
start:
_main:
    sub esp, 12

    ; Input string
    PRINTF prompt
    FFLUSH STDOUTF
    SCANF readLineFormat, string

    lea esi, [string] ; &string
    mov edi, esi
    mov ah, ' ' ; previous symbol

process:
    lodsb
    cmp al, ' ' ; if (al != ' ') { save; }
    jnz save
        cmp al, ah ; if (al == ' ' && ah == ' ') { continue; }
        jz process

save:
    stosb
    mov ah, al ; save previous symbol
    test al, al ; if (!eof) { continue; }
    jnz process

    ; Output result
    PRINTF resultFmt, string

    EXIT 0
