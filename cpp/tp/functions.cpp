#include <iostream>
using namespace std;

int sum(int a, int b = 20) { /* b with default value */
  int result;
  result = a + b;

  /* 
   * it seems the older style for C 
   * was calling return like a function
   * using parems -> return(value);
   */

  return (result);
}

int main() {
  int a = 100;
  int b = 200;
  int result;

  // calling fn providing both values
  result = sum(a, b); // a bunch of redundant code... examples.
  cout << "total value is: " << result << endl;

  // calling fn letting the default param act
  result = sum(a);
  cout << "total value is: " << result << endl;

  return 0;
}

