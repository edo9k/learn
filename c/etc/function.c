#include <stdio.h>

#define MAX 100000
#define MIN (MAX * -1)

int f(int x, int  y) {
  return 2*x*x + x*x*x + x - 4*x*x*x*x + 5*x*x*x*x*x + 8 == y;
}

int main() {
  for (int x = MIN; x < MAX; x++)
    for (int y = MIN; y < MAX; y++)
      if ( f(x,y) ) 
        printf(" true at x: %d, y: %d \n", x, y);

  return 0;
}
