#include <time.h>
#include <stdlib.h>
#include <stdio.h>

const int NUMBER_OF_ITEMS =   20;
const int UPPER_LIMIT     =  100;
const int LOWER_LIMIT     = -100;


int ranged_random() {
  return rand() % (UPPER_LIMIT - LOWER_LIMIT + 1) + LOWER_LIMIT;
}


int main() {

  srand(time(NULL)); // seed random generator (i guess)

  printf("{ ");

  for (int i = 0; i < NUMBER_OF_ITEMS; i++)
    printf("%d, ", ranged_random());
  
  printf(" };\n\n");

  return 0;
}

