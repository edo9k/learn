#include <stdio.h>

int main() {
  unsigned long accumulator = 0;
  char c[1000];

  for (int i = 0;; i++) {
    scanf("%c", &c[i]);
    if(c[i]=='\n') break;
  }

  for (int i = 0; c[i] != '\0'; i++) {
    if (c[i]=='H') 
      printf("Hello, World!\n");

    else if (c[i] == 'Q')
      printf("%.*s", (int)sizeof c, c);

    else if (c[i] == '9') {
      for (int i = 99; i > 0; i--) {
        printf("%d bottles of beer on the wall,\n%d bottles of beer.\n", i, i);
        printf("Take one down, pass it around,\n%d bottles of on the wall.", i - 1);
      }
      printf("1 bottle of beer on the wall,\n1bottle of beer.\nTake one down, pass it around,\nno more bottles of beer on the wall.\n"); 
    } else if (c[i]=='+') accumulator++;
  }

  return 0;
}

