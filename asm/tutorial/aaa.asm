section .text
  global _start

_start:
  mov esi, 4  ; pointer to the rightmost digit
  mov ecx, 5  ; number of digits
  clc

add_loop:
  mov al, [num1 + esi]
  adc al, [num2 + esi]
  aaa
  pushf
  or  al, 0x30
  popf

  mov [sum + esi], al
  dec esi
  loop add_loop

  mov eax, 4
  mov ebx, 1
  mov ecx, msg
  mov edx, len
  int 0x80

  mov eax, 4
  mov ebx, 1
  mov ecx, sum
  mov edx, 5
  int 0x80

  mov eax, 1
  int 0x80

section .data
  msg db 'The sum is: ', 0xA
  len equ $ - msg
  num1 db '12345'
  num2 db '23456'
  sum  db '     '

