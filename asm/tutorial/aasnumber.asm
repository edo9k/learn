section .text
  global _start

_start:
  sub ah, ah
  mov al, '9'
  sub al, '3'
  aas
  or  al, 0x30
  mov [res], ax

  mov eax, 4
  mov ebx, 1
  mov ecx, msg
  mov edx, len
  int 0x80

  mov eax, 4
  mov ebx, 1
  mov ecx, res
  mov edx, 1
  int 0x80

  mov eax, 1
  int 0x80

section .data
  msg db 'The result is: ', 0xA
  len equ $ - msg

section .bss
  res resb 1

