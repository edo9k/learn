;

;
; void iprint(integer number)
; prints integer
iprint:
  push  eax
  push  ecx
  push  edx
  push  esi
  mov   ecx, 0

divide_loop:
  inc ecx
  mov edx, 0
  mov esi, 10
  idiv esi
  add edx, 48
  push edx
  cmp eax, 0
  jnz divide_loop

print_loop:
  dec ecx
  mov eax, esp
  call sprint
  pop eax
  cmp ecx, 0
  jnz print_loop

  pop esi
  pop edx
  pop ecx
  ret

;
; void iprintLF(integer number)
; integer printing function w/ linefeed
iprintLF:
  call iprint

  push eax
  mov eax, 0ah
  push eax
  mov eax, esp
  call sprint
  pop eax
  pop eax
  ret
  
  
; int slen(string text)
; calculates string length
slen:
  push  ebx
  mov   ebx, eax

nextchar:
  cmp   byte [eax], 0
  jz    finished
  inc   eax
  jmp   nextchar

finished:
  sub   eax, ebx
  pop   ebx
  ret


;
; void sprint(string text)
; print function
sprint:
  push  edx
  push  ecx
  push  ebx
  push  eax
  call  slen

  mov edx, eax
  pop eax

  mov ecx, eax
  mov ebx, 1
  mov eax, 4
  int 80h

  pop ebx
  pop ecx
  pop edx
  ret

;
; void sprint_ln(string text)
; print with line feed
sprintLF:
  call sprint

  push  eax
  mov   eax, 0ah
  push  eax
  mov   eax, esp
  call  sprint
  pop   eax
  pop   eax
  ret


;
; void exit()
; quits program zero status (no errors)
quit:
  mov ebx, 0
  mov eax, 1
  int 80h
  ret

