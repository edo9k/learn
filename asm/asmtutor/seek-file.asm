;

%include 'functions.asm'

section .data
  filename db 'textfile.txt', 0h
  contents db '-updated-', 0h

section .text
global _start

_start:
  mov ecx, 1  ; writeonly flag (O_WRONLY)
  mov ebx, filename
  mov eax, 5
  int 80h

  mov edx, 2  ; SEEK_END argument
  mov ecx, 0  ; set cursor at 0 bytes
  mov ebx, eax  ; move file descriptor to ebx
  mov eax, 19 ; invoke SYS_LSEEK (kernel opcode 19)
  int 80h

  mov edx, 9  ; number of byte to write
  mov ecx, contents 
  mov ebx, ebx  ; not needed, move file descriptor into ebx
  mov eax, 4
  int 80h

  call quit
  
