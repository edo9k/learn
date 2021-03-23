#include <stdio.h>
#include <string.h>

/*
 * Union types allow you to story different types of values
 * in the tame memory location. But only one at a time. 
 */

union Data {
  int i;
  float f;
  char str[20];
};

int main() {
  union Data data;

  printf("Memory size used by the union: %ld\n", sizeof(data));

  data.i = 10;
  printf("Data.i: %d\n", data.i);

  data.f = 220.5;
  printf("data.f: %f\n", data.f);

  strcpy(data.str, "C Programming");
  printf("data.str: %s\n", data.str);

  return 0;
}

