;

%include 'functions.asm'

section .data
  filename db 'textfile.txt', 0h
  contents db 'Hello, World!', 0h

section .bss
  file_contents resb 255,  ; variable to store file contents

section .text
global _start

_start:
  
  ; create file
  mov ecx, 0777
  mov ebx, filename
  mov eax, 8
  int 80h

  ; write contents
  mov edx, 13 ; text length
  mov ecx, contents
  mov ebx, eax
  mov eax, 4
  int 80h

  ; open file
  mov ecx, 0  ; readonly flag (O_RDONLY)
  mov ebx, filename 
  mov eax, 5  ; invoke SYS_OPEN (kernel opcode 5)
  int 80h

  call iprintLF ; print file handler number

  ; read file contents
  mov edx, 13   ; how many byte to read
  mov ecx, file_contents  ; pointer to memory area for content
  mov ebx, eax  ; move file descriptor into ebx
  mov eax, 3    ; SYS_READ (kernel opcode 3)
  int 80h

  ; print content
  mov eax, file_contents  ; move memory address before calling print
  call sprintLF

  ; close file
  mov ebx, ebx ; not needed since the descriptor is already in ebx...
  mov eax, 6   ; SYS_CLOSE (kernel opcode 6)
  int 80h

  call quit

