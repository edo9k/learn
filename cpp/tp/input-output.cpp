#include <iostream>

using namespace std;

int main() {
  char str[] = "String for output example.";
  char name[256];

  cout << "str -> " << str << endl;
  cout << "(input test) write ya name: ";
  cin >> name;
  cout << "the input was: " << name << endl;

  return 0;
}

