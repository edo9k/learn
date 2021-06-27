#include <iostream>
#include <string>

using namespace std;

int main() {

  string hello  = "Hello, World!";
  string copy   = "string tmp var";
  string year   = "2021";
  string lang   = "C++";
  int length;

  // copy one string into the other
  // with C style strings we'd have to use
  // strcpy( string_a, string_b );
  copy = hello;
  cout << "original string: " << hello << endl;
  cout << "copied string:   " << copy  << endl;
  
  // concat strings
  // with C style we'd have to use 
  // strcat( string_a, string_b );
  copy = hello + " (" + year + ") ";
  cout << "conat'ed string: " << copy << endl;

  // get string length with object-method style
  // string.size(); wiht C style strings we'd need
  // strlen(str1);
  length = hello.size();
  cout  << "string hello -> " << hello  << endl
        << "length/size  -> " << length << endl;

  return 0;
}

