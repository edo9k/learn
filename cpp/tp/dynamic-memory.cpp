#include <iostream>

using namespace std;

class Box {
  public:
    Box() {
      cout << "Constructor called. Object created." << endl;
    }

    ~Box() {
      cout << "Destructor called. Object destroyed." << endl;
    }
};

int main() {
  Box* boxArray = new Box[4];
  delete [] boxArray;

  return 0;
}

