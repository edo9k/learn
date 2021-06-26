#include <iostream>
using namespace std;

/* 
 * accessing array elements using pointers
 * instead of bracket notation
 */

int main() {
  double balance[4] = { 2021.0, 1024.0, 512.64, 6502.99 };
  double *p;

  p = balance;

  cout  << "Access array positions by incrementing the pointer" 
        << endl;

  for (int i = 0; i < 4; i++)
    cout << " *(pointer + " << i << ") "
         << " -> " << *(p + i) << endl;

  cout << "The same can be done with the array name" << endl;

  for (int i = 0; i < 4; i++)
    cout << " *(variable + " << i << ") "
         << " -> " << *(balance + i) << endl;

  return 0;
}

