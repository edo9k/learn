#include <stdio.h>
#include <stdlib.h>

int main() {
  char c;

  system("/bin/stty raw");

  puts("qualquer letra menos a..z, menos k.\r\n");
  puts("e ! para sair.\r\n");
  
  while(1) {
    c = getchar();
    puts("\r");

    if (c == '!') break;

    if (c == 'k') 
      puts("Ignorado.\r\n");

    else if (c >= 'a' && c <= 'z') 
      printf("Você digitou -> %c \r\n", c);
    else puts("Falei que era só entre a-z, caramba.\r\n");
  }

  puts("Você digitou !, finalizando.");

  system("/bin/stty cooked");
  return 0;
}
