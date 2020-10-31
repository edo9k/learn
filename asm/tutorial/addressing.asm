section .text
  global _start

_start:

  ; print name
  mov eax, 4
  mov ebx, 1
  mov ecx, name
  mov edx, namelen
  int 0x80
  
  ; overwrite name location
  mov [name], dword 'Nuha' 

  ; print name location again
  mov eax, 4
  mov ebx, 1
  mov ecx, name
  mov edx, namelen
  int 0x80

  ; exit
  mov eax, 1
  int 0x80
  

section .data
  name db 'Zara Ali ', 0xA
  namelen equ $ - name 
