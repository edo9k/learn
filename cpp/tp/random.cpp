#include <iostream>
#include <ctime>
#include <cstdlib>

using namespace std;

int main() {

  // using computer clock to set random seed
  srand( (unsigned) time( NULL ) );

  // get ten random numbers;
  for (int i = 0; i < 10; i++) 
    cout << " rand() -> " << rand() << endl;

  return 0;
}

