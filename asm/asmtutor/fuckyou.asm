;
; responds with nice json message 
;

%include 'functions.asm'

section .data ; response string
  response db 'HTTP/1.1 200 OK', 0dh, 0ah, 'Content-Type: text/json', 0dh, 0ah, 'Content-Length: 26', 0dh, 0ah, 0dh, 0ah, '{ "response": "fuck you" }', 0dh, 0ah, 0h
  length  equ $ - response
 
section .bss
  buffer resb 255, ; variable to store request headers

section .text
global _start

_start:
  xor eax, eax  ; zeroing shit
  xor ebx, ebx
  xor edi, edi
  xor esi, esi

_socket:       ; create socket (lesson 29)
  push byte 6  ; push IPPROTO_TCP code onto the stack
  push byte 1  ; push SOCK_STREAM code onto the stack
  push byte 2  ; push PF_INET     code onto the stack
  mov ecx, esp ; move address of args into ecx
  mov ebx, 1   ; invoke subroutine SOCKET (1)
  mov eax, 102 ; invoke SYS_SOCKETCALL (kernel opcode 102)
  int 80h

_bind:           ; bind socket (lesson 30)
  mov edi, eax   ; store socket file descriptor into edi
  push dword 0x0000000 ; 0.0.0.0 IP ADDRESS, pushed onto the stack
  push word  0x2923    ; push port number into stack (port 9001, reverse order)
  push word  2         ; push 2 decimal onto stack (AF_INET)
  mov ecx, esp         ; move address of stack pointer into ecx
  push byte 16         ; push 16 decimal onto stack (arg length)
  push ecx      ; push address of arguments 
  push edi      ; push file descriptor
  mov ecx, esp  ; mov address of arguments onto stack
  mov ebx, 2    ; invoke BIND (2)
  mov eax, 102  ; invoke SYS_SOCKETCALL (kernel opcode 102)
  int 80h

_listen:       ; listen (lesson 31)
  push byte 1  ; move 1 onto stack (max queue length)
  push edi     ; push file descriptor onto stack
  mov ecx, esp ; move address of arguments into ecx
  mov ebx, 4   ; invoke subrouteine LISTEN (4)
  mov eax, 102 ; invoke SYS_SOCKETCALL (kernel opcode 102)
  int 80h

_accept:       ; accept (lesson 32)
  push byte 0  ; push 0 onto stack (address length arg)
  push byte 0  ; push 0 onto stack (address argument)
  push edi     ; push the file descriptor onto the stack
  mov ecx, esp ; move address of arguments into ecx
  mov ebx, 5   ; invoke subroutine ACCEPT (5)
  mov eax, 102 ; invoke SYS_SOCKETCALL (kernel opcode 102)
  int 80h

_fork:          ; forking a process to answer connection (lesson 33)
  mov esi, eax  ; move return value of SYS_SOCKETCALL into esi 
  mov eax, 2    ; invoke SYS_FORK (kernel opcode 2)
  int 80h

  cmp eax, 0  ; if return value of SYS_FORK is zero, this is the child process 
  jz _read    ; child process jumps to _read

  jmp _accept ; parent process jumps to _accept

_read:         ; the actual reading of received request (lesson 33)
  mov edx, 255 ; we're only reading the first 255 bytes
  mov ecx, buffer  ; store memory byffer addr in ecx
  mov ebx, esi     ; move esi into ebx (socket file descriptor)
  mov eax, 3       ; invoke SYS_READ (kernel opcode 3)
  int 80h

  mov eax, buffer  ; store buffer addr in eax, for printing
  call sprintLF     ; print

_write:       ; write socket (lesson 34)
  mov edx, length  ; length of bytes to write
  mov ecx, response ; address of response
  mov ebx, esi ; move file descriptor into ebx
  mov eax, 4  ; SYS_WRITE kernel opcode
  int 80h

_close:       ; close socket (lesson 35)
  mov ebx, esi  ; move file descriptor into ebx
  mov eax, 6    ; invoke SYS_CLOSE opcode
  int 80h

_exit:
  call quit

