#include <stdio.h>

int main() {
  int a, b;

  puts("Enter first number: ");
  scanf("%d", &a);

  puts("\nEnter second number: ");
  scanf("%d", &b);

  printf("\n%d + %d = %d", a, b, a + b);
  printf("\n%d - %d = %d", a, b, a - b);
  printf("\n%d * %d = %d", a, b, a * b);
  printf("\n%d / %d = %d", a, b, a / b);

  puts("\n");
  return 0;
}

