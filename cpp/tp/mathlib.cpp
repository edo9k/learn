#include <iostream>
#include <cmath>
using namespace std;

int main() {
  
  // dummy numbers 
  short   s = 64;
  int     i = -32;
  long    l = 1234567;
  float   f = 3.14;
  double  d = 3.14159265;

  // using cmath
  cout << " sin(d) ----> " << d << " -> " << sin(d)   << endl; 
  cout << " abs(i) ----> " << i << " -> " << abs(i) << endl; 
  cout << " floor(d) --> " << d << " -> " << floor(d)  << endl; 
  cout << " sqrt(f) ---> " << f << " -> " << sqrt(f) << endl; 
  cout << " pow(d, 2) -> " << d << " -> " << pow(d, 2) << endl;
  
  return 0;
}

