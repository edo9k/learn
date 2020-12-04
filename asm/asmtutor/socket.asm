;

%include 'functions.asm'

section .text
global _start

_start:
  xor eax, eax  ; zeroing shit
  xor ebx, ebx
  xor edi, edi
  xor esi, esi

_socket:
  push byte 6  ; push IPPROTO_TCP code onto the stack
  push byte 1  ; push SOCK_STREAM code onto the stack
  push byte 2  ; push PF_INET     code onto the stack
  mov ecx, esp ; move address of args into ecx
  mov ebx, 1   ; invoke subroutine SOCKET (1)
  mov eax, 102 ; invoke SYS_SOCKETCALL (kernel opcode 102)
  int 80h

  call iprintLF ; call integer print function
                ; which will print the file descriptor
                ; the descriptor will be in EAX
                ; or will be -1 in case of error

_exit:
  call quit

