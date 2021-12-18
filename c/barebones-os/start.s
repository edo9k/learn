
.extern kernel_main // external entry point from kernel.c

.global start


// magic numbers

.set MB_MAGIC, 0x1BADB002           // make grub happy
.set MB_FLAGS, (1 << 0) | (1 << 1)  // load modules, provide memory map
.set MB_CHECKSUM, (0 - (MB_MAGIC + MB_FLAGS))



.section  .multiboot
  .align 4
  .long MB_MAGIC
  .long MB_FLAGS
  .long MB_CHECKSUM


.section .bss
  .align 16
  stack_bottom: 
    .skip 4096    // reserve 4k stack for our c code to use

  stack_top:


// actual code, finally.

.section .text

  start:
    mov $stack_top, %esp      // set stack pointer to the top of the stack

    call kernel_main          // give control to our c code

    hang:                     // in case something goes wrong
      cli                     // disable all cpu interrupts
      hlt                     // try to halt the cpu
      jmp hang                // or keep trying until it works

