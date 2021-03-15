#include <stdio.h>
#include <stdbool.h>

int main() {

  int a = 10;
  int b = 20;


  printf("\nOperators work as exptected\n");

  printf("values used: a = %d, b = %d\n\n", a, b);

  printf("a + b = %5d\n", a + b); 
  printf("a - b = %5d\n", a - b); 
  printf("a * b = %5d\n", a * b); 
  
  /* printing a float is different 
   * you need to cast it first with 
   * (float) number. C won't do it 
   * automatically. */
  printf("a / b = %2.3f\n", (float) a / b ); 

  printf("\nUnary operators\n");
  printf("a++ -> %d, when next called %d\n", a++, a); 
  printf("b-- -> %d, when next called %d\n", b--, b); 
  printf("--a -> %d, immedate dec\n", --a);
  printf("++b -> %d, immedate inc\n", ++b);

  printf("\nRelational operators (or just the comparison shit)\n");
  printf("1 == 1 -> %s\n", (1 == 1) ? " TRUE" : "FALSE" ); 
  printf("1 == 2 -> %s\n", (1 == 2) ? " TRUE" : "FALSE" ); 
  printf("1 != 1 -> %s\n", (1 != 1) ? " TRUE" : "FALSE" ); 
  printf("1 != 2 -> %s\n", (1 != 2) ? " TRUE" : "FALSE" ); 
  printf("1 >  1 -> %s\n", (1 >  1) ? " TRUE" : "FALSE" ); 
  printf("1 >  2 -> %s\n", (1 >  2) ? " TRUE" : "FALSE" ); 
  printf("1 <  1 -> %s\n", (1 <  1) ? " TRUE" : "FALSE" ); 
  printf("1 <  2 -> %s\n", (1 <  2) ? " TRUE" : "FALSE" ); 
  printf("1 >= 1 -> %s\n", (1 >= 1) ? " TRUE" : "FALSE" ); 
  printf("1 >= 2 -> %s\n", (1 >= 2) ? " TRUE" : "FALSE" ); 
  printf("1 <= 1 -> %s\n", (1 <= 1) ? " TRUE" : "FALSE" ); 
  printf("1 <= 2 -> %s\n", (1 <= 2) ? " TRUE" : "FALSE" ); 

  printf("\nLogical Operators\n");
  printf("true  && true  -> %s\n", (true  && true)  ? " TRUE" : "FALSE" ); 
  printf("false && false -> %s\n", (false && false) ? " TRUE" : "FALSE" ); 
  printf("true  && false -> %s\n", (true  && false) ? " TRUE" : "FALSE" ); 
  printf("true  || true  -> %s\n", (true  || true)  ? " TRUE" : "FALSE" ); 
  printf("false || false -> %s\n", (false || false) ? " TRUE" : "FALSE" ); 
  printf("true  || false -> %s\n", (true  || false) ? " TRUE" : "FALSE" ); 
  printf("!true  -> %s\n", (!true)  ? " TRUE" : "FALSE" ); 
  printf("!false -> %s\n", (!false) ? " TRUE" : "FALSE" ); 


  /* there are still the bitwise operators 
   * and bunch of assignment shorcuts
   * I won't be doing those */

  printf("\n\n");
  return 0;
}

