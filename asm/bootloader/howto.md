# Hello World Bootloader

These are two really small bootloaders written in assembly, that only print "Hello, World!" and loop forever. 

They don't do anything interesting, but helped me understand how a simple bootloader works. And made the magic number `0xAA55` impossible to forget.


## With GNU Assembler (as)

assemble

`as -o boot.o boot.s`

link

`ld -o boot.bin --oformat binary -e init -o boot.bin boot.o`

run on qemu

`qemu-system-x86_64 boot.bin`

## With NASM

assmemble/link 

`nasm -o boot.bin boot.asm`

run

`qemu-system-x86_64 boot.bin`


---

### Resources 

"Writing an x86 Hello-World Bootload with assembly" https://50linesofco.de/post/2018-02-28-writing-an-x86-hello-world-bootloader-with-assembly

"Writing a Simple OS from Scratch" https://www.cs.bham.ac.uk/~exr/lectures/opsys/10_11/lectures/os-dev.pdf

