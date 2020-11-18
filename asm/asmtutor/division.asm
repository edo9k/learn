;

%include 'functions.asm'

section .data
  msg db  ' remainder '

section .text
global _start

_start:
  mov eax, 90
  mov ebx, 9
  div ebx
  call iprint
  mov eax, msg
  call sprint
  mov eax, edx
  call iprintLF

  call quit

