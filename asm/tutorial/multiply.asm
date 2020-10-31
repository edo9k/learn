section .text
  global _start

_start: 
  mov al, '3'
  sub al, '0' ; type casting?

  mov bl, '2'
  sub bl, '0' ; type casting? 

  mul bl
  add al, '0' ; same?

  mov [res], al ; store result

  mov eax, 4
  mov ebx, 1
  mov ecx, msg
  mov edx, len
  int 0x80

  ; display res(ult)
  mov eax, 4
  mov ebx, 1
  mov ecx, res
  mov edx, 1
  int 0x80

  ; exit
  mov eax, 1
  int 0x80

section .data
  msg db "The result is: ", 0xA, 0xD
  len equ $ - msg

segment .bss
  res resb 1

