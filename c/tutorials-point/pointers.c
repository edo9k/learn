#include <stdio.h>

int main() {
  int var = 256; // regular normie variable
  int *ip;      // pointer

  ip = &var; // store address of `var` in ip;

  printf("address of var variable:   %x\n", &var);
  printf("address stored in pointer: %x\n",   ip);
  printf("accessin var from pointer: %d\n",  *ip);

  printf("\n");
  return 0;
}

