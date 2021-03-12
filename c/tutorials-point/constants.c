#include <stdio.h>

// constants can be define with #define
// that is sort of a macro or the like

#define LENGTH 10
#define WIDTH 5
#define NL "\n"

int main() {
  int area = LENGTH * WIDTH;

  printf("length: %d %s", LENGTH, NL );
  printf("width : %d %s", WIDTH,  NL );
  printf("area  : %d %s", area,   NL );
  printf("%s", NL );

  // constants can also be defined with const 
  const int YEAR = 2021;

  printf("this example was written in %d\n\n", YEAR);

  return 0;
}
