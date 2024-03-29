#include <iostream>

using namespace std;

#define PI 3.14159
#define MIN(a,b) (((a)<(b)) ? a : b)

#define DEBUG

#define concat(a, b) a ## b

int main() {
  cout << "Preprocessor constants and functions." << endl;
  cout << "PI defined macro -> " << PI << endl;
  cout << "Minimum -> " << MIN(2021, 2022) << endl;

#ifdef DEBUG
  cerr << "Trace: inside main function." << endl;
#endif

#if 0
  cout << MKSTR(HELLO C++) << endl;
#endif

  cout << "Conditional compilation example." << endl;

#ifdef DEBUG
  cerr << "Trace: coming out of the main function." << endl;
#endif

  int year = 2021;

  cout << "This year with concated varible -> " << concat(ye, ar) << endl;

  cout << "Predefined macros: " << endl;
  cout << "Value of __LINE__ -> " << __LINE__ << endl; 
  cout << "Value of __FILE__ -> " << __FILE__ << endl; 
  cout << "Value of __DATE__ -> " << __DATE__ << endl; 
  cout << "Value of __TIME__ -> " << __TIME__ << endl; 

  return 0;
}

