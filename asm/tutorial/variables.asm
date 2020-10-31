section .text
  global _start ; the linker wills it

_start:           ; main
  mov eax, 4      ; sys_write
  mov ebx, 1      ; choose stdout
  mov ecx, choice ; message
  mov edx, 2      ; length
  int 0x80        ; call kernel

  ; exit
  mov eax, 1
  int 0x80

section .data
  choice db 'y', 0xA

