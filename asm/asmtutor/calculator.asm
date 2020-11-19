;

%include  'functions.asm'

section .text
global _start

_start:
  pop ecx ; number of arguments
  pop edx ; program name
  sub ecx, 1 ; arg-number - 1 (program name)
  mov edx, 0

next_arg:
  cmp ecx, 0h ; check if there are arguments left
  jz no_more_args ; jump if zero
  pop eax     ; get next arg
  call atoi   ; ascii to integer conversion
  add edx, eax ; addition logic
  dec ecx ; arg-number--
  jmp next_arg

no_more_args:
  mov eax, edx
  call iprintLF
  call quit

