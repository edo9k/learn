section .text
  global _start

_start:
  mov eax, 3
  mov ebx, 0
  mov ecx, x

top: 
  add ebx, [ecx]
  add ecx, 1
  dec eax
  jnz top

done: 
  add ebx, '0'
  mov [sum], ebx

display:
  mov eax, 4
  mov ebx, 1
  mov ecx, sum
  mov edx, 1
  int 0x80

  mov eax, 1
  int 0x80

section .data
  global x
  x:
    db 2
    db 4
    db 3

  sum:
    db 0

