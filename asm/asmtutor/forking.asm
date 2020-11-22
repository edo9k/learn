; forking threads

%include 'functions.asm'

section .data
child_message   db  'Saludos from the child process', 0h
parent_message  db  'Um salve from the parent process', 0h

section .text
global _start

_start:
  mov eax, 2  ; sys_fork (kernel opcode 2)
  int 80h

  cmp eax, 0
  jz  child

parent:
  mov eax, parent_message
  call sprintLF

  call quit

child:
  mov eax, child_message
  call sprintLF

  call quit

