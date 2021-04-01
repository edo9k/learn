#include <stdio.h>

/* 
 * macros defined for example purposes
 * br       -> prints a linebreak
 * echo     -> prints text with linebreak
 * echoName -> prints variable named in the parameter 
 * saqure   -> square two number via macro */

#define br puts("\n")
#define echo(a) puts(#a"\n")
#define square(x) ((x) * (x))

int main() {

  printf("using some predefined macros\n");

  printf("using macro __FILE__ -> %s (gets source file name)\n",     __FILE__);
  printf("using macro __DATE__ -> %s (gets date at compile time)\n", __DATE__);
  printf("using macro __TIME__ -> %s (gets time of compilation)\n",  __TIME__);
  printf("using macro __LINE__ -> %d (gets line of source file)\n",  __LINE__);
  printf("using macro __STDC__ -> %d (ANSI compliant flag)\n",       __STDC__);
  br; 

  echo("This text was print with a macro.");
  echo("It also works for numbers.");
  echo(666); 
  
  printf("8 squared with macro = %d\n", square(8));

  return 0;
}
