#include <iostream>
using namespace std;

// these are just "declarations", like abstract classes, 
// they have not been defined yet, but just declared to exist.
// and must be later defined (even another file, lib or program). 

extern int a, b;
extern int c;
extern float f;
extern bool  t;

int main () {

  // trying to print before difinition will through 
  // a reference error
  // cout << "int a  --> " << a << endl;

  int a, b, c; // <- actual "definitions" now
  float f;
  bool t;

  // before initialization they seem to print trash values.
  cout << "all defined, but not yet initialized: " << endl;
  cout << "int a  --> " << a << endl;
  cout << "int b  --> " << b << endl;
  cout << "int c  --> " << c << endl;
  cout << "float f -> " << f << endl;
  cout << "bool  t -> " << t << endl;

  a = 2021; // <- and now initializations
  b =  -34;
  c = a + b;
  f = 256.0 / 81.0;
  t = true; 

  cout << "\nafter initialization: " << endl;
  cout << "int a  --> " << a << endl;
  cout << "int b  --> " << b << endl;
  cout << "int c  --> " << c << endl;
  cout << "float f -> " << f << endl;
  cout << "bool  t -> " << t << endl;

  return 0;
}

