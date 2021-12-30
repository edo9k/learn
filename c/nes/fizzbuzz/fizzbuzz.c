#include <nes.h>
#include <stdlib.h>
#include <string.h>

#define PPU_CTRL2       0x2001
#define PPU_VRAM_ADDR1  0x2005
#define PPU_VRAM_ADDR2  0x2006
#define PPU_VRAM_IO     0x2007

#define poke(addr, data)    (*((unsigned char*)addr) = data)

#define ppu_2(a, b) {             \
  poke(PPU_VRAM_ADDR2, a);        \
  poke(PPU_VRAM_ADDR2, b);        \
} 

#define ppu_set_cursor(x, y) ppu_2(0x20+((y)>>3), ((y)<<5)+(x))

#define ppu_set_scroll(x, y) {    \
  poke(PPU_VRAM_ADDR1, x);        \
  poke(PPU_VRAM_ADDR1, y);        \
}

#define ppu_set_color_text(c) { ppu_2(0x3F, 0x03); ppu_io(c); }

#define ppu_set_color_back(c) { ppu_2(0x3F, 0x00); ppu_io(c); }

#define ppu_io(c) poke(PPU_VRAM_IO, (c))

// ----


void write_xy(char *str, int x, int y) {
  ppu_set_cursor(x, y);

  while(*str) {
    ppu_io(*str);
    str++;
  }
}

int main() {
  int frame = 0; 
  int i = 1;
  char buffer[4] = "    ";


  waitvblank();
  ppu_set_color_back(0x11);
  ppu_set_color_text(0x10);

  while (i < 75) {
    if (i % 15 == 0) {
      write_xy("FizzBuzz", 2 + (i / 25) * 9, i % 25);
    } else if (i %  5 == 0) {
      write_xy("Buzz", 2 + (i / 25) * 9, i % 25);
    } else if (i %  3 == 0) {
      write_xy("Fizz", 2 + (i / 25) * 9, i % 25);
    } else {
      itoa(i, buffer, 10);
      write_xy(buffer, 2 + (i / 25) * 9, i % 25);
    }

    i++;
  }

  ppu_set_scroll(0, 0);
  poke(PPU_CTRL2, 8);

  while (1);

  return 0;
}

