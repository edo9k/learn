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

// another base class
class PaintCost {
  public:
    int getCost(int area) {
      return area * 70;
    }
};

// derived class with multiple inheritance
class Rectangle: public Shape, public PaintCost {
  public:
    int getArea() {
      return (width * height);
    }
};

int main() {
  Rectangle r;
  int area;

  r.setWidth(5);
  r.setHeight(7);

  area = r.getArea();

  cout << "Total area: " << r.getArea() << endl;
  cout << "Paint cost: " << r.getCost(area) << endl;

  return 0;
}

