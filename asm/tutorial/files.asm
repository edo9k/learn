section .text
  global _start

_start:
  ; create file
  mov eax, 8
  mov ebx, file_name
  mov ecx, 0777       ; chmod 777
  int 0x80

  mov [fd_out], eax

  ; write 
  mov eax, 4          ; sys_write
  mov ebx, [fd_out]   ; file descriptor
  mov ecx, msg        ; string to write
  mov edx, len
  int 0x80

  ; close file
  mov eax, 6
  mov ebx, [fd_out]

  ; write bye-bye message
  mov eax, 4
  mov ebx, 1
  mov ecx, msg_done
  mov edx, len_done
  int 0x80

  ; open file for reading
  mov eax, 5
  mov ebx, file_name
  mov ecx, 0
  mov edx, 0777
  int 0x80

  mov [fd_in], eax

  ; read from file
  mov eax, 3
  mov ebx, [fd_in]
  mov ecx, info
  mov edx, 26
  int 0x80

  ; close the file
  mov eax, 6
  mov ebx, [fd_in]
  int 0x80

  ; print info
  mov eax, 4
  mov ebx, 1
  mov ecx, info
  mov edx, 26
  int 0x80

  ; exit
  mov eax, 1
  int 0x80

section .data
  file_name db 'myfile.txt'
  msg db 'Welcome to tutorials point'
  len equ $ - msg

  msg_done db 'Written to file', 0xA
  len_done equ $ - msg_done

section .bss
  fd_out resb 1
  fd_in  resb 1
  info resb 26

