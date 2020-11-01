section .text
  global _start

_start:
  mov al, 5         ; store 5 in low register a
  mov bl, 3         ; store 3 in low register b
  or  al, bl        ; low-a = low-a ^OR low-b
  add al, byte '0'  ; decimal -> string casting

  mov [result], al  ; store in result

  ; print result
  mov eax, 4
  mov ebx, 1
  mov ecx, result
  mov edx, 1
  int 0x80

outprog:
  mov eax, 1
  int 0x80

section .bss
  result resb 1

