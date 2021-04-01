#include <stdio.h>

/* 
 * classic recusion examples
 * naive factorial and fibonacci
 */

unsigned long long int factorial(unsigned int i) {
  if (i < 2) return 1;
  return i * factorial(i - 1);
}

// very slow
int fibonacci (int i) {
  if (i < 2) return i;
  return fibonacci(i-1) + fibonacci(i-2);
}

int main() {

  for (int i = 1; i < 10; i++)
    printf("number: %3d,   fibonacci: %3d,   factorial: %6lld \n", 
        i, fibonacci(i), factorial(i)); 
  
  return 0;
}

