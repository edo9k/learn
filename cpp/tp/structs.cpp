#include <iostream>
#include <cstring>

#define LENGTH 255

using namespace std;

struct Books {
  char title   [LENGTH]; 
  char author  [LENGTH];
  char subject [LENGTH];
  int id;
};

int main() {
  struct Books b1;
  struct Books b2;

  // first book
  strcpy( b1.title,   "Melt Your Brain With C++");
  strcpy( b1.author,  "Fulano de Tal");
  strcpy( b1.subject, "C++ Programming");
  b1.id = 6502;
  
  // second book
  strcpy( b2.title,   "Melt Your Brain With Haskell");
  strcpy( b2.author,  "Cicrano de Tal");
  strcpy( b2.subject, "Haskell Programming");
  b2.id = 8086;
  
  cout << " Book 1 " << endl;
  cout << " Title: " << b1.title << endl;
  cout << " Author: " << b1.author << endl;
  cout << " Subject: " << b1.subject << endl;
  cout << " id: " << b1.id << endl;
  
  cout << " Book 2 " << endl;
  cout << " Title: " << b2.title << endl;
  cout << " Author: " << b2.author << endl;
  cout << " Subject: " << b2.subject << endl;
  cout << " id: " << b2.id << endl;

  return 0;
}

