#include <iostream>

using namespace std;


class Shape {
  protected:
    int width, height;

  public: 
    Shape(int a = 0, int b = 0) { // constructor
      width  = a;
      height = b;
    }

    /*
     * not declaring this funcition as virtual would trigger
     * and 'early binding' of the function/method.
     * Which means, both classes that inherit Shape would be calling
     * this version of the method when calling obj->area().
     * To make sure each child class can implement it's own version
     * of the method, and be able to use it, we need to declare this 
     * method as `virtual`.
     *
     * This is also called "dynamic linkage" or "late binding". 
     * As opposed to the what normal methods do, that is "static linkage"
     * or "early binding". 
     */

    virtual int area() {
      cout << "Parent class area." << endl;
      return 0;
    }
};

class Rectangle: public Shape {
  public:
    Rectangle(int a = 0, int b = 0): Shape(a, b) { }

    int area() {
      cout << "Rectangle class area." << endl;
      return(width * height);
    }
};

class Triangle: public Shape {
  public:
    Triangle(int a = 0, int b = 0): Shape(a, b) { }

    int area() {
      cout << "Triangle class areaa." << endl;
      return width * height / 2;
    }
};

int main() {
  Shape *shape;
  Rectangle rec(10, 7);
  Triangle tri(10, 5);

  // store address of rectangle
  shape = &rec;

  // call rectangle area
  shape->area();

  // store address of triangle
  shape = &tri;

  // call triangle area
  shape->area();

  return 0;
}

