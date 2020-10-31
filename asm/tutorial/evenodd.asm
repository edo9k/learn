section .text
  global _start

_start:
  mov ax, 0x8
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

