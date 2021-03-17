#include <stdio.h>

/* as in any other languages that has the concept of pointers
 * passing by value will not outer the external variables, 
 * passing by pointer will allow the function to alter said
 * external variables. */


void swapByValue(int  x, int  y);
void swapByRef  (int *x, int *y);

int main() {

  int a = 100;
  int b = 200;

  printf("-- using values (swapByValue)\n");
  printf("variabables before fn call a = %d, b = %d\n", a, b);
  swapByValue(a, b);
  printf("variabables after  fn call a = %d, b = %d\n", a, b);

  printf("\n\n");

  printf("-- using values (swapByRef)\n");
  printf("variabables before fn call a = %d, b = %d\n", a, b);
  swapByRef(&a, &b);
  printf("variabables after  fn call a = %d, b = %d\n", a, b);

  return 0;
}

void swapByValue(int x, int y) {
  int temp;

  temp = x;
  x = y;
  y = temp;

  return; /* waht? */
}

void swapByRef(int *x, int *y) {
  int temp;

  temp = *x;
  *x = *y;
  *y = temp;

  return;
}
