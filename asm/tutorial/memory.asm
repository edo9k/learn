section .text
  global _start

_start:
  mov eax, 45   ; sys_brk (malloc?)
  xor ebx, ebx 
  int 0x80

  add eax, 16384  ; number of bytes do allocate
  mov ebx, eax
  mov eax, 45     ; sys_brk
  int 0x80

  cmp eax, 0
  jl exit         ; if error -> exit
  mov edi, eax    ; edi -> highest address available
  sub edi, 4      ; point to las DWORD
  mov ecx, 4096   ; number of DWORDs allocated
  xor eax, eax    ; clear eax
  std             ; backward
  rep stosd       ; repeat for all alloctaed space
  cld             ; set DF flag to normal

  ; print
  mov eax, 4
  mov ebx, 1
  mov ecx, msg
  mov edx, len
  int 0x80

exit:
  mov eax, 1
  xor ebx, ebx
  int 0x80

section .data
  msg db 'Allocated 16KB of memory.', 10
  len equ $ - msg
    
