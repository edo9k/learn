#include <iostream>

using namespace std;


class Box {
  public:
    double getVolume(void) {
      return length * width * height;
    }

    void setLength(double length) {
      this->length = length;
    }

    void setWidth(double width) {
      this->width = width;
    }

    void setHeight(double height) {
      this->height = height;
    }

    /*
     * overload sum operator
     */
    Box operator+(const Box& b) {
      Box box;
      box.length  = this->length + b.length;
      box.width   = this->width  + b.width;
      box.height  = this->height + b.height;
      return box;
    }

  private:
    double length;
    double width;
    double height;
};

int main() {
  Box b1, b2, b3;
  
  double volume {0.0};

  // first box
  b1.setLength(6.0);
  b1.setWidth (7.0);
  b1.setHeight(5.0);

  // second box
  b2.setLength(12.0);
  b2.setWidth (13.0);
  b2.setHeight(10.0);

  // volume of first box
  cout << "Volume of first box:  " << b1.getVolume() << endl;

  // volume of second box
  cout << "Volume of second box: " << b2.getVolume() << endl;

  // sum two boxes, print volume of resulting box
  b3 = b1 + b2;
  cout << "Volume of third box:  " << b3.getVolume() << endl;

  return 0;
}

