; dealing with command line arguments

%include 'functions.asm'

section .text
global _start

_start:
  pop ecx ; first value is the number of arguments

next_arg:
  cmp ecx, 0h
  jz  no_more_args
  pop eax
  call  sprintLF
  dec ecx
  jmp next_arg

no_more_args:
  call quit

