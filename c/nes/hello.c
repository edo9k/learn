#include <nes.h>

#define PPU_CTRL2       0x2001
#define PPU_VRAM_ADDR1  0x2005
#define PPU_VRAM_ADDR2  0x2006
#define PPU_VRAM_IO     0x2007

#define APU_STATUS      0x4015
#define APU_PULSE       0x4000

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

#define apu_status(c) poke(APU_STATUS, (c))

#define apu_pulse(ch, r, c) poke(APU_PULSE+((ch)<<2)+(r), (c))


// ----


void write_string(char *str) {
  ppu_set_cursor(1, 2);

  while(*str) {
    ppu_io(*str);
    str++;
  }
}

int main() {
  int frame = 0; 

  waitvblank();

  ppu_set_color_back(0x11);

  ppu_set_color_text(0x10);

  write_string("Hello, World! (from CC65)");

  ppu_set_scroll(0, 0);

  poke(PPU_CTRL2, 8);

  apu_status(1);

  apu_pulse(0, 2, 0x08);
  apu_pulse(0, 3, 0x02);

  apu_pulse(0, 0, 0xBF);

  while(1) {
    waitvblank();
    frame++;

    if (frame == 60) {
      apu_pulse(0, 2, 0x93);
      apu_pulse(0, 3, 0x01);
    } else if (frame == 120) {
      apu_pulse(0, 2, 0x08);
      apu_pulse(0, 3, 0x02);
      frame = 0;
    }
  }

  while (1);

  return 0;
}

