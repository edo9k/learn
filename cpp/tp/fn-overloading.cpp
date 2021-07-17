#include <iostream>
#include <string>

using namespace std;

class PrintData {
  public:
    void print(int i) {
      cout << "int -> " << i << endl;
    }

    void print(double f) {
      cout << "float -> " << f << endl;
    }

    void print(string c) {
      cout << "char -> " << c << endl;
    }
};

int main() {
  PrintData pd;

  pd.print(2020); // calls int version
  pd.print(3.14f); // calls float version
  pd.print("Overloading modafockaars!"); // string version

  return 0;
}

