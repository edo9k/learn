; a macro with two params

%macro write_string 2
  mov eax, 4
  mov ebx, 1
  mov ecx, %1
  mov edx, %2
  int 0x80
%endmacro

section .text
  global _start

_start:
  write_string msg1, len1
  write_string msg2, len2
  write_string msg3, len3

  mov eax, 1
  int 0x80

section .data
  msg1 db 'Print from a macro.', 0xA, 0xD
  len1 equ $ - msg1

  msg2 db 'Linux, assembly, yadayada', 0xA, 0xD
  len2 equ $ - msg2  
  
  msg3 db 'Done.', 0xA, 0xD
  len3 equ $ - msg3

