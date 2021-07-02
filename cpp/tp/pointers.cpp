#include <iostream>
using namespace std;


int main() {
  int  var1;
  char var2[10];


  // you can get the address of any variable with the & symbol
  // again, same as in C

  cout  << "Address of var1 variable: "
        << &var1 << endl;

  cout  << "Address of var1 variable: "
        << &var2 << endl;


  // pointers work as expected

  int year = 2021;
  int *pointer;
  int **pointer_pointer;

  pointer = &year; // address of integer year
  pointer_pointer = &pointer; // p -> p -> variable

  cout << "int year -> "       << year     << endl;
  cout << "int *pointer -> "   << pointer  << endl;
  cout << "deref *pointer -> " << *pointer << endl;

  // you can also get crazy in have pointer-pointers
  cout << "deref -> deref -> " << **pointer_pointer << endl;

  return 0;
}

