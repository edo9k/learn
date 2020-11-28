;

%include 'functions.asm'

section .data
  filename db 'textfile.txt', 0h

section .text
global _start

_start:
  mov ebx, filename ; name of file to be deleted
  mov eax, 10 ; invoke SYS_UNLINK (kernel opcode 10)
  int 80h     ; interrupt / call kernel

  call quit   ; I quit!

