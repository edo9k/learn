;

%include 'functions.asm'

section .data
  request db 'GET / HTTP/1.1', 0dh, 0ah, 'Host: 139.162.39.66:80', 0dh, 0ah, 0dh, 0ah, 0h

section .bss
  buffer resb 1, ; varible to store response

section .text
global _start

_start:
  xor eax, eax  ; zeroing the whole shit
  xor ebx, ebx
  xor edi, edi

_socket:    ; creates socket 'file' and leaves descriptor -> eax
  push byte 6 ; 6 -> IPPROTO_TCP
  push byte 1 ; 1 -> SOCK_STREAM
  push byte 2 ; 2 -> PF_INET
  mov ecx, esp  ; move address of args into ecx
  mov ebx, 1    ; SOCKET subroutine (1)
  mov eax, 102  ; SYS_SOCKETCALL (opcode 102)
  int 80h

_connect:
  mov edi, eax  ; move file descriptor into edi 
  push dword 0x4227a28b ; push ip onto stack (139.162.39.66)
  push word 0x5000  ; push 80 PORT onto stack
  push word 2   ; push 2 onto stack (AF_INET)
  mov ecx, esp  ; move stack pointer addr to ecx
  push byte 16  ; push 16 onto stack (arg length)
  push ecx  ; push address of arguments
  push edi  ; push file descriptor
  mov ecx, esp ; move addr of args into ecx
  mov ebx, 3   ; invoke CONNECT (3)
  mov eax, 102 ; invoke SYS_SOCKETCALL (opcode 102)
  int 80h

_write:
  mov edx, 43 ; mov 43 into edx (length in bytes to write)
  mov ecx, request ; mov addr of requiest variable -> ecx
  mov ebx, edi  ; store file descriptor in ebx
  mov eax, 4  ; SYS_WRITE (4)
  int 80h

_read:
  mov edx, 1  ; bytes to read
  mov ecx, buffer ; more location into ecx
  mov ebx, edi  ; file descriptor into -> ebx
  mov eax, 3  ; SYS_READ (3)
  int 80h

  cmp eax, 0  ; if SYS_READ returned zero, it's EOF
  jz _close   ; jump to _close, because the file is over

  mov eax, buffer ; addr of shit to be printed
  call sprint   ; print what eax points to
  jmp _read   

_close:
  mov ebx, edi  ; move file descriptor into ebx
  mov eax, 6    ; SYS_CLOSE (6)
  int 80h

_exit:
  call quit
 
