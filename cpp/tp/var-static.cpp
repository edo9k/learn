#include <iostream>
using namespace std;

void func(void);

static int count = 10; /* global static variable */


int main() {
  while(count--) 
    func();

  return 0;
}

void func(void) {
  static int i = 5; // will not be destroyed 
                    // and will not reset to 5
                    // after first initialization
  i++;

  cout << "i -> " << i;
  cout << " count -> " << count << endl;
}

