#include <iostream>
using namespace std;

int main() {
  const int  LENGTH  = 10;
  const int  WIDTH   = 5;
  const char NEWLINE = '\n';
  
  int area = LENGTH * WIDTH;

  /* constants work as expected.
   * you can also use #define instead of 
   * creating an immutable variable.
   * it's different under the hood, but has
   * the same effect in the end
   */

  cout << area;
  cout << NEWLINE;

  return 0;

} 
