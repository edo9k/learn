section .text
  global _start

_start:
  mov bx, 3
  call proc_fact
  add ax, 0x30
  mov [fact], ax

  mov eax, 4
  mov ebx, 1
  mov ecx, msg
  mov edx, len
  int 0x80

  mov eax, 4
  mov ebx, 1
  mov ecx, fact
  mov edx, 1
  int 0x80

  mov eax, 1
  int 0x80

proc_fact:
  cmp bl, 1
  jg do_calc
  mov ax, 1
  ret

do_calc:
  dec bl
  call proc_fact
  inc bl
  mul bl
  ret 

section .data
  msg db 'Factorial 3 is: ', 0xA
  len equ $ - msg

section .bss
  fact resb 1

