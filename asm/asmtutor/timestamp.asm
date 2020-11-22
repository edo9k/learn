; print time with opcode 13

%include 'functions.asm'

section .data
  msg db  'Seconds since Unix Epoch (1970-01-01): ', 0h

section .text
global _start

_start:
  mov eax, msg
  call sprint

  mov eax, 13
  int 80h

  call iprintLF
  call quit

