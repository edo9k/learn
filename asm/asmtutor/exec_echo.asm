;

%include 'functions.asm'

section .data
command     db  '/bin/echo', 0h
arg1        db  'Hello, World!', 0h
arguments   dd  command
            dd  arg1
            dd  0h
environment dd  0h

section .text
global _start

_start:
  mov edx, environment
  mov ecx, arguments
  mov ebx, command
  mov eax, 11
  int 80h

  call quit 

