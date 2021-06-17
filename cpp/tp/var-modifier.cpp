#include <iostream>
using namespace std;

/*
 * just like in C, you can alter variables behavior using
 * these modifiers:
 * signed, unsigned, long, short.
 */

int main() {
  short int i; // signed short int
  short unsigned int j; // unsigned short int

  j = 50000; // will wrap around to zero
  i = j;    // will correctly display 50k

  cout << i << " " << j << endl;

  return 0;
}

