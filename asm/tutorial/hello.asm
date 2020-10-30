section .text
  global _start ; the linker requires this declaration

_start:         ; entry point
  mov eax, 4    ; sys_write syscall
  mov ebx, 1    ; choose stdout 
  mov ecx, msg  ; text (pointer? position?)
  mov edx, len  ; text length
  int 0x80      ; call kernel

  mov eax, 1    ; sys_exit syscall
  int 0x80      ; call kernel

section .data
  msg db 'Hello, World!', 0xa ; string with linebreak
  len equ $ - msg             ; string length

