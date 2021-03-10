/* 
 * implements a function style `map` fn in c
 * using pointer magic
 */

#include <stdio.h>  // printf
#include <stdlib.h> // malloc, free, etc.

// this is the function we're applying with map
int triple(int number) {
  return number * 3;
}

// arcane magic (full of pointer shit)
int *map(int (*function)(int), int *array, int size) {

  // allocates space for our to-be-returned mapped array
  int *newArray = malloc(sizeof(int) * size);

  // applies the provided function to every element 
  for (int i = 0; i < size; i++)
    newArray[i] = function(array[i]);
  // this is confusing because 'function' is not a reserved word
  // in C, it's just a variable, it could be anything else...
  // like just f for example, or provided_fn, anything.
  
  return newArray; // returns mapped array
}

void main() {
  // our victim (test) array
  int array[10] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};

  // call map with triple function, returns newArray (pointer)
  int *tripledArray = map(triple, array, 10);

  puts("\nCalls triple function on each element of array: \n");

  for (int i=0; i < 10; i++) {
    printf("original: %d ", array[i]);
    printf("  mapped: %d ", tripledArray[i]);
    puts(" ");
  }
  
  // free allocated space for return array
  free(tripledArray);
}


