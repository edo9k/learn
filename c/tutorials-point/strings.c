#include <stdio.h>
#include <string.h>

int main() {

  char str1[256] = "Hello, ";
  char str2[256] = "World!";
  char str3[256];

  int len;

  printf("\ncopy string with strcpy\n");
  strcpy(str3, str1); // like some assemblies, its strcpy(target, source)
  printf("strcpy(str3, str1); -> %s\n", str3);

  printf("\nconcat with strcat\n");
  strcat(str1, str2); // target <- source
  printf("strcat(str1, str2); -> %s\n",  str1);

  printf("\nget length with strlen\n");
  len = strlen(str1);
  printf("strlen(str1);       -> %d\n", len);

  printf("\ncompare strings with strcmp\n");
  printf("strcmp(str1, str1); -> %s\n", !strcmp(str1, str1) ? "TRUE" : "FALSE");
  printf("strcmp(str1, str2); -> %s\n", !strcmp(str1, str2) ? "TRUE" : "FALSE");

  printf("\nfind character position with strchr\n");
  printf("strchr(str1, \" \"); -> %s\n", strchr(str1, ' '));
  printf("strchr(str1, \"X\"); -> %s\n", strchr(str1, 'X'));

  printf("\nfind position of substring in string\n");
  printf("strstr(str1, str2); -> %s\n", strstr(str1, str2));

  printf("\n\
    both strchr and strstr return a pointer to the     \n\
    location where the string or character is found     \n\
    which causes printf to print the string form that    \n\
    point on. you need a bit more to get the index        \n\
    -> index = (int) (occurence_pointer - string_pointer); \n\n");

  char *pointer;
  int     index;
  
  pointer = strchr(str1, ' ');
  index = (int)(pointer - str1);
  printf("The index for the space in \"%s\", is %d\n", str1, index);

  pointer = strstr(str1, str2);
  index = (int)(pointer - str1);
  printf("The index for the \"%s\" in \"%s\", is %d\n", str2, str1, index);

  printf("\n");
  return 0;
}

