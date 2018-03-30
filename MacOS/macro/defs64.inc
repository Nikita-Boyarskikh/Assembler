%ifndef DEFS_INC
%define DEFS_INC

%include 'macro/common_defs.inc'

; https://opensource.apple.com/source/xnu/xnu-1504.3.12/bsd/kern/syscalls.master
%define SYS_NOOP  0x2000000
%define SYS_EXIT  0x2000001
%define SYS_FORK  0x2000002
%define SYS_READ  0x2000003
%define SYS_WRITE 0x2000004

%endif ; DEFS_INC
