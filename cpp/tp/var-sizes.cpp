
#include <iostream>
using namespace std;

int main() {
  cout << "Sizes of builtin C++ data types.\n" << endl;

  cout << "Size of bool -------> " << sizeof(bool) << " byte  " << endl;
  cout << "Size of char -------> " << sizeof(char) << " byte  " << endl;
  cout << "Size of int  -------> " << sizeof(int)  << " bytes " << endl;

  cout << "Size of short int --> " << sizeof(short int) << " bytes " << endl;
  cout << "Size of long int  --> " << sizeof(long  int) << " bytes " << endl;

  cout << "Size of float  -----> " << sizeof(float)   << " bytes " << endl;
  cout << "Size of double -----> " << sizeof(double)  << " bytes " << endl;
  cout << "Size of wchar_t ----> " << sizeof(wchar_t) << " bytes " << endl;

  /* this does not work because `void` has size zero. 
   * it should return size 0 then... but who knows why they decided
   * not to allow asking sizeof for a void...
   *
   * ->  cout << "Size of void -------> " << sizeof(void) << " bytes " << endl;
   *
   * turns out there's a discussion about this on Stack Overflow.
   * `void` is an "incomplete type", and sizeof do not apply to these.
   *
   *  https://stackoverflow.com/a/28259072/46455909
   *
  */

  return 0;
}

