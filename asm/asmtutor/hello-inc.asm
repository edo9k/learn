; hello world that includes shit from functions.asm file

%include  'functions.asm'

section .data
msg1 db 'This is another assembly print shit example.', 0ah
msg2 db 'Something something, more text, etc.', 0ah

section .text
global _start

_start:
  mov   eax, msg1
  call  sprint

  mov   eax, msg2
  call  sprint

  call quit

