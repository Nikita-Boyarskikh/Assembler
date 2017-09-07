nasm -felf $1 -o a.o -l list && ld -m elf_i386 -s a.o && ./a.out
