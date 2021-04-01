#include <stdio.h>
#include <stdarg.h>

/*
 * variadict arguments means that a function
 * can have a variablenumber_of_itemsber of arguments.
 * this is done with the stdarg package. */

double average(int number_of_items, ...) {
  va_list valist;
  double sum = 0.0;

  va_start(valist, number_of_items); // init valist with n of args

  for (int i = 0; i < number_of_items; i++)
    sum += va_arg(valist, int);

  va_end(valist); // deallocate reserved memory

  return sum/number_of_items;
}

int main() {
  printf("Average of  1..10  = %6.2f\n", 
    average(10, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10));
  
  printf("Average of 10..100 = %6.2f\n",
    average(10, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100));

  return 0;
} 

