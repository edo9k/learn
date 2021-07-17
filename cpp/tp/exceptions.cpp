#include <iostream>

using namespace std;

struct CustomException: public exception {
  const char * what () const throw () {
    return "A new exception, just for you.";
  }
};

double division(int a, int b) {
  if (b == 0) {
    throw "ERROR: Division by zero.";
  }
  return (a/b);
}

int main() {
  int     x = 50;
  int     y = 0;
  double  z = 0;

  try {
    z = division(x, y);
    cout << z << endl;
  } catch (const char* msg) {
    cerr << msg << endl;
  }

  try {
    throw CustomException();
  } catch(CustomException& e) {
    cout << "CustomException thrown and caught." << endl;
    cout << e.what() << endl;
  } catch (exception& e) {
    // other errors caught here
  }


  return 0;
}

