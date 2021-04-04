#include <stdio.h>

int main( int argc, char *argv[]) {

  /* the first element is always the program name */
  printf("Program name %s\n", argv[0]);

  /* argc counts the number of arguments received */
  printf("You have supplied %d arguments.\n", argc - 1);

  /* printing all arguments */
  for (int i = 1; i < argc; i++)
    printf("Argument #%2d: %24s\n", i, argv[i]);

  /* after compiling, run 
   * ./a.out $(ls)
   * which will print the name of every file in the directory
   */

  return 0;
}

