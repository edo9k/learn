#include <iostream>

using namespace std;

/*
 * cpp "interfaces" are akin to the concept of 
 * abstract classes in other object oriented classes.
 *
 * in cpp a class becomes abstract when at least one of
 * its methods is declared a 'pure virtual' method.
 *
 */

class Shape {
  public: 
    virtual int getArea() = 0;
    // this assignment defines the method as 'pure virtual'

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

class Rectangle: public Shape {
  public:
    int getArea() {
      return width * height;
    }
};

class Triangle: public Shape {
  public:
    int getArea() {
      return (width * height) / 2;
    }
};

int main() {
  Rectangle r;
  Triangle  t;

  r.setWidth(5);
  r.setHeight(7);

  cout << "Total Rectangle area: " << r.getArea() << endl;

  t.setWidth(5);
  t.setHeight(7);

  cout << "Total Triangle area: " << t.getArea() << endl;

  return 0;
}

