; 

%include "functions.asm"

section .data
  filename db 'readme.txt'

section .text
global _start

_start:
  mov eax, 8    ; sys_create (kernel opcode 8)
  mov ebx, filename
  mov ecx, 0777 ; full permission to anyone
  int 80h

  call quit

