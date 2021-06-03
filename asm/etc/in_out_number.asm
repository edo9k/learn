
;
; reads number from stdin
; prints the same to stdout
;
; this comes from tutorials point
; and for some reading the stdin number was wrong
; since i'm not good in assembly at all, it took
; me a while to find it out. 
;


section .data
 user_message db 'Please enter a number: '
 user_message_length equ $ - user_message
 display_message db 0xA, 'You have entered: '
 display_message_length equ $ - display_message
 number_length equ 25

section .bss
 num resb number_length


section .text
 global _start

_start:
 mov eax, 4
 mov ebx, 1
 mov ecx, user_message
 mov edx, user_message_length
 int 0x80

 mov eax, 3
 mov ebx, 0 ; stdin
 mov ecx, num
 mov edx, number_length
 int 0x80

 mov eax, 4
 mov ebx, 1
 mov ecx, display_message
 mov edx, display_message_length
 int 0x80

 mov eax, 4
 mov ebx, 1
 mov ecx, num
 mov edx, number_length
 int 0x80
 
 mov eax, 1
 mov ebx, 0
 int 0x80

