#include <iostream>

int count;

// declare we'll be using an extern fn
extern void write_extern();

int main() {
  count = 5;
  write_extern(); // fn from the other file

  return 0;
}

