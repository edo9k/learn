#include <iostream>

using namespace std;

int main() {

  // variables
  int    i;
  double d;

  // ...references to them.
  int&    r = i;
  double& s = d;

  i = 5;

  cout << "Value of i -----> " << i << endl;
  cout << "Value of i ref -> " << r << endl;

  d = 333.0 / 106;
  cout << "Value of d -----> " << d << endl;
  cout << "Value of d ref -> " << s << endl;

  return 0;
}
