#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
  char name[255];
  char *description;

  strcpy(name, "Dennis Ritchie");

  /* dynamic allocation */
  description = malloc(56 * sizeof(char));

  if (description == NULL)
    fprintf(stderr, "Error - unable to allocate required memory. \n");
  else 
    strcpy(description, "A true legend. ");

  /* reallocate for with even more space */
  description = realloc( description, 255 * sizeof(char));

  if (description == NULL) 
    fprintf(stderr, "Error - unable to allocate required memory.\n");
  else 
    strcat(description, "Creator of the C programming language.\n");
  
  printf("Full Name:   %s\n", name);
  printf("Description: %s\n", description);

  /* release memory */
  free(description);
}

