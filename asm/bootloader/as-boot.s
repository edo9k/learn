.code16 # enter 16 bit mode
.global init

init:
  mov $msg, %si
  mov $0xe, %ah
print_char:
  lodsb
  cmp $0, %al
  je done
  # je init # <- this would loop forever

  int $0x10 # the "print" interrupt
  jmp print_char
done:
  hlt # halt?

msg: .asciz "Hello World [Ctrl+Alt+G to quit]"

.fill 510-(.-init), 1, 0 # zero up to 510 bytes

.word 0xAA55 # magic boot bytes

