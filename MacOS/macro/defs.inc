%ifndef DEFS_INC
%define DEFS_INC

%include 'macro/common_defs.inc'

%define syscall int 0x80

; https://opensource.apple.com/source/xnu/xnu-1504.3.12/bsd/kern/syscalls.master
%define SYS_NOOP  0
%define SYS_EXIT  1
%define SYS_FORK  2
%define SYS_READ  3
%define SYS_WRITE 4

%endif ; DEFS_INC
