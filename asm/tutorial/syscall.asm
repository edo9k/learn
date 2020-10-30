
; messages to the user
section .data
  message1 db 'please enter a number: '
  message1len equ $ - message1
  message2 db 'you have entere: '
  message2len equ $ - message2

; uninitialized data
section .bss
  num resb 5

; code segment
section .text
  global _start

; entry point
_start:

  ; display first message
  mov eax, 4
  mov ebx, 1
  mov ecx, message1
  mov edx, message1len
  int 80h

  ; read and store input
  mov eax, 3
  mov ebx, 2
  mov ecx, num
  mov edx, 5
  int 80h

  ; display second message
  mov eax, 4
  mov ebx, 1
  mov ecx, message2
  mov edx, message2len
  int 80h
  
  ; display number from input
  mov eax, 4
  mov ebx, 1
  mov ecx, num
  mov edx, 5
  int 80h

  ; exit
  mov eax, 1
  mov ebx, 2
  int 80h

