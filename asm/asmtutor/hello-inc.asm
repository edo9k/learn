; hello world that includes shit from functions.asm file

%include  'functions.asm'

section .data
msg1 db 'This is another assembly print shit example.',0h
msg2 db 'Something something, more text, etc.', 0h

section .text
global _start

_start:
  mov   eax, msg1
  call  sprintLF

  mov   eax, msg2
  call  sprintLF

  call quit

