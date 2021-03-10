/* 
 * implements a function style `map` fn in c
 * using pointer magic
 */

#include <stdio.h>    // printf
#include <stdlib.h>   // malloc, free, etc.
#include <stdbool.h>  // booleans

// this is the function we're applying with map
int triple(int number) {
  return number * 3;
}

// this is the function we're using with filter
bool even(int number) {
  return number % 2 == 0;
}

// this is the function we're using with reduce
int sum(int current, int accumulator) {
  return current + accumulator;
}

// my print -> gambiarra
void print(int value) {
  printf(" %d, ", value);
}

// arcane magic (full of pointer shit)
int *map(int (*function)(int), int *array) {

  int length = sizeof array / sizeof array[0];
  // allocates space for our to-be-returned mapped array
  int *newArray = malloc(sizeof(int) * length);

  // applies the provided function to every element 
  for (int i = 0; i < length; i++)
    newArray[i] = function(array[i]);
  // this is confusing because 'function' is not a reserved word
  // in C, it's just a variable, it could be anything else...
  // like just f for example, or provided_fn, anything.
  
  return newArray; // returns mapped array
}

int *filter(bool (*function)(int), int *array) {
    
  int length = sizeof array / sizeof array[0];

  /* a dynamic structured would be better her */
  int *newArray = malloc(sizeof(int) * length);

  for (int i = 0; i < length; i++)
    if (function(array[i]))
      newArray[i] = array[i]; // will leave empty spaces

  return newArray;
}

// c does not have default values for params, gotta check this initialValue
int reduce(int (*function)(int, int), int *array, int initialValue) {
  int length = sizeof array / sizeof array[0];

  int accumulator = initialValue;

  for (int i = 0; i < length; i++)
    accumulator = function(accumulator, array[i]);

  return accumulator;
}

void forEach(void (*function)(int), int* array) {

  int length = sizeof array / sizeof array[0];

  for (int i = 0; i < length; i++) {
    function(array[i]);
  }
}

void main() {
  // our victim (test) array
  int array[10] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};

  // call map with triple function, returns newArray (pointer)
  int *mapped = map(triple, array);
  forEach(print, mapped);
  free(mapped);

  int *filtered = filter(even, array);
  forEach(print, filtered);
  free(filtered);

  int reduced = reduce(sum, array, 0);
  forEach(print, &reduced);
 
  /*
  for (int i=0; i < 10; i++) {
    printf("original: %d ", array[i]);
    printf("  mapped: %d ", mapped[i]);
    puts(" ");
  }
  */

  //int *filtered = filter(even, array);
  
  // free allocated space for return array

  puts("\n--\n");
}


