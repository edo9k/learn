#include <stdio.h>

// formatted according to the text
// compiler complaints about variable n being 
// an "implicit" int, but compiles. 
double inner(v1, v2, n)
double v1[], v2[];
{
  double sum;
  int i;
  sum = 0.0;
  for (i=0;i<n;i++)
    sum =+ v1[i]*v2[i];
  return(sum);
}

// according to the document, this is more efficient
// because: pointers
double _inner(v1, v2, n)
double *v1, *v2;
{
  double sum;
  sum = 0.0;
  while(n--)             // hacky 1: false when reaches 0
    sum=+ *v1++ * *v2++; // hacky 2: increasing the pointer
  return(sum);
}


// ----------------------------
int main() {
  double list1[] = { 0.5, 0.75, 1.35 };
  double list2[] = { 0.7, 0.99, 1.01 };

  printf("1. inner product: %f\n",  inner(list1, list2, 3));
  printf("2. inner product: %f\n", _inner(list1, list2, 3));

  return 0;
}
