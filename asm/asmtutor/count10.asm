; count to 10

%include  'functions.asm'

section .text
global _start

_start:
  mov ecx, 0

next_number:
  inc ecx

  mov eax, ecx
  add eax, 48
  push eax
  mov eax, esp
  call sprintLF

  pop eax
  cmp ecx, 10
  jne next_number

  call quit

