
%include 'functions.asm'

section .text
global _start

_start:
  mov ecx, 0

next_number:
  inc ecx
  mov eax, ecx
  call iprintLF
  cmp ecx, 10
  jne next_number

  call quit

