segment .text ; = section
  global _start

_start:
  mov eax, 4
  mov ebx, 1
  mov ecx, msg
  mov edx, len
  int 0x80

  mov eax, 4
  mov ebx, 1
  mov ecx, star
  mov edx, starlen
  int 0x80

  mov eax, 1
  int 0x80

segment .data
  msg db 'displaying 42 asterisks', 0xa
  len equ $ - msg

  star times 42 db '*'
  starlen equ $ - star
  
