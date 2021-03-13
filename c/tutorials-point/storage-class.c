
#include <stdio.h>

void func(void);

static int count = 5; /* global */

extern int number; /* declared in extern-variable.c */

/* 
 * this needs to be compiled together with extern-variable.c
 * 
 * gcc storage-class.c extern-variable.c
 *
 */

int main () {

  // STATIC VARIABLE example
  printf("static variables persist through all the execution.\n");
  while( count-- ) {
    func();
  }

  // EXTERN VARIABLE example
  printf("\n\nprinting an extern variable (declared on a different file)\n");
  printf("extern number: %d\n\n", number);

  return 0;
}

void func(void) {
  static int i = 5; /* local, but static */
  i++;

  printf("local variable i: %d, global variable count: %d \n", i, count);
}

