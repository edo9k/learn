; fizzbuzz

%include 'functions.asm'

section .data
fizz db 'Fizz', 0h
buzz db 'Buzz', 0h

section .text
global _start

_start:
  mov esi, 0  ; our checkFizz flag
  mov edi, 0  ; our checkBuzz flag
  mov ecx, 0  ; i (counter)

next_number:
  inc ecx ; i++

.check_fizz:
  mov edx, 0
  mov eax, ecx
  mov ebx, 3
  div ebx
  mov edi, edx
  cmp edi, 0
  jne .check_buzz
  mov eax, fizz
  call sprint

.check_buzz:
  mov edx, 0
  mov eax, ecx
  mov ebx, 5
  div ebx
  mov esi, edx
  cmp esi, 0
  jne .check_int
  mov eax, buzz
  call sprint

.check_int:
  cmp edi, 0
  je .continue
  cmp esi, 0
  je .continue
  mov eax, ecx
  call iprint

.continue:
  mov eax, 0ah
  push eax
  mov eax, esp
  call sprint
  pop eax
  cmp ecx, 100
  jne next_number

  call quit


