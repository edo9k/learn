#include <iostream>

using namespace std;

// base class
class Shape {
  public:
    void setWidth(int w) {
      width = w;
    }

    void setHeight(int h) {
      height = h;
    }

  protected:
    int width;
    int height;

};

// derived class
class Rectangle: public Shape {
  public:
    int getArea() {
      return (width * height);
    }
};

int main() {
  Rectangle r;

  r.setWidth(5);
  r.setHeight(7);

  cout << "Total area: " << r.getArea() << endl;

  return 0;
}

