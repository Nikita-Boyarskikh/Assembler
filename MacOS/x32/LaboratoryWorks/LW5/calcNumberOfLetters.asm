%include 'macro.inc'

; void __fastcall debug(int position, char letter, int count);
extern _debug

; void __cdecl calcNumberOfLetters(int letters[255], const char *text, int textSize);
global _calcNumberOfLetters

section .data

section .bss

section .text
_calcNumberOfLetters:
    push ebp
    mov ebp, esp
    sub esp, 8

    ; Initialize with zeros
    mov edi, [ebp + 8]        ; int *letters
    mov ecx, 255              ; len(letters) - 1
    xor eax, eax
    cld
    rep stosd

    mov ecx, dword [ebp + 16] ; int textSize
    test ecx, ecx
    jz return ; if(textSize == 0) { return; }

    for_text:
        mov edx, [ebp + 8]  ; int *letters
        mov ebx, [ebp + 12] ; char *text
        mov al, byte [ebx + ecx - 1] ; text[ecx]
        cbw
        cwde
        mov edi, eax
        imul edi, 4
        inc dword [edx + edi] ; letters[text[ecx]]++

        ; debug(ecx, eax, [edx + edi])
        push ecx
        sub esp, 12
        ; mov ecx, ecx       ; position
        xchg eax, edx        ; letter
        mov eax, [eax + edi] ; count
        mov [esp], eax
        call _debug
        add esp, 8
        pop ecx
    loop for_text

return:
    mov esp, ebp
    pop ebp
    ret
