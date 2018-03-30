global start

section .text
start:
    ud2

section .data
; целое число 25 размером 2 байта
dat25 dw 25
; двойное слово, содержащее -35
datdblw dd -35
; символьная строка, содержащая имя
nameeng db 'Nikita',0 ; на английском
namerus db 'Никита',0 ; на русском
