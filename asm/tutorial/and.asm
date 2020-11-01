section .text
  global _start

_start:
  mov ax, 0x999999999
  and ax, 1
  jz even
  mov eax, 4
  mov ebx, 1
  mov ecx, odd_msg
  mov edx, odd_len
  int 0x80
  jmp outprog

even:
  mov ah, 0x9
  mov eax, 4
  mov ebx, 1
  mov ecx, even_msg
  mov edx, even_len
  int 0x80

outprog:
  mov eax, 1
  int 0x80

section .data
  even_msg db 'Even.'
  even_len equ $ - even_msg

  odd_msg db 'Odd.'
  odd_len equ $ - odd_msg

