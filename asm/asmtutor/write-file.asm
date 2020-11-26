;

%include 'functions.asm'

section .data
  filename db 'textfile', 0h
  contents db 'Hi, I am a text file.', 10h, 0h
  len      equ $ - contents

section .text
global _start

_start:
  mov eax, 8  ; create file (kernel opcode 8)
  mov ebx, filename
  mov ecx, 0777 ; just like chmod
  int 80h

  mov edx, len ; length, how many bytes to write
  mov ecx, contents
  mov ebx, eax  ; move file descriptor into ebx
  mov eax, 4 ; sys_write (kernel opcode 4)
  int 80h

  call quit

