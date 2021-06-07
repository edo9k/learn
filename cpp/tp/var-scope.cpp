#include <iostream>
using namespace std;

// global 
int year = 2021;

// global variables are initialized by default
// local variables are not.
int set_by_default;

void shadowing();

int main() {

  cout << "variable scope works as expected.\n" << endl;
  
  cout << "(global) year -> " << year << endl;
  shadowing(); // shadows year variable
  cout << "(global) year -> " << year << endl;

  int beast = 666;
  cout << "(local) beast -> " << beast << endl;

  cout << "\nThere are three ways of initializing a variables in C++" << endl;
  cout << "int copy_init n = 123; int direct_init(123); int list_init{123};" << endl;
  cout << "learncpp.net encourages using list initialization." << endl;
  cout << "since it won't truncate values without warning." << endl;
  cout << "it's said to be faster too. not sure." << endl;

  /*
   * both local and global varibles are being set to zero
   * when declared. maybe this changed after the tutorial was
   * written. 
   *
   * int not_set_by_default;
   * cout << " globals are automatically initialized " << endl;
   * cout << set_by_default << endl;
   * cout << " locals are not initizalized by default " << endl;
   * cout << not_set_by_default << endl;
   */

  return 0;
}

void shadowing() {
  int year = 1945;

  cout << "(fn local) year -> " << year << endl;
}
