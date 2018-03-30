%use ifunc
%use fp

%include 'macro/common_defs.inc'

%macro ALIGN_STACK 0.nolist
    and esp, -16
%endmacro
