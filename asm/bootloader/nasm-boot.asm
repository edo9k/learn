[bits 16] ; using 16 bits
[org 0x7c00] ; sets start address

init:
  mov si, msg
  mov ah, 0x0e

print_char:
  lodsb ; load byte from SI to AL and inc address in SI
  cmp al, 0
  je done
  int 0x10 ; print interrupt
  jmp print_char

done:
  hlt ; halt

msg: db "Hello, World!", 0 ; typical zero terminated string

times 510 - ($ - $$) db 0 ; fill with zero bytes magic

dw 0xAA55 ; magic number

