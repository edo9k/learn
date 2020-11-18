;

%include 'functions.asm'

section .start
global _start

_start:

  mov eax, 90
  mov ebx, 9
  add eax, ebx
  call iprintLF

  call quit

