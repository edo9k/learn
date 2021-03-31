#include <stdio.h>

int main() {
  FILE *fp;
  char buffer[255];


  printf("\nyou can write files with either fprintf or fputs\n");

  /* creating a writing to a file */
  fp = fopen("/tmp/c-file-test.txt", "w+"); // open file with write permission
  fprintf(fp, "adding text to file with fprintf \n");
  fputs("it also works with fputs, with a different syntax...\n", fp);
  fclose(fp); // close file 

  printf("a test file was created in '/tmp/c-file-test.txt' \
      \ncat for this file to check it worked.\n\n");

  /* reading from the file we just created */
  printf("contents of test file \n----------\n");
  fp = fopen("/tmp/c-file-test.txt", "r"); // open file with read permission
  fscanf(fp, "%s", buffer);
  printf("1: %s\n", buffer);

  fgets(buffer, 255, (FILE*)fp);
  printf("2: %s\n", buffer);

  fgets(buffer, 255, (FILE*)fp);
  printf("3: %s\n", buffer);
  fclose(fp);

  printf("\n----------\n");
  printf("you can read files with either fscanf or fgets.\n\n");

  return 0;
}

