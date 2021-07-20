#include <iostream>
#include <vector>
#include <cstdlib>
#include <string>
#include <stdexcept>

using namespace std;

template <class T>
class Stack {
  private:
    vector<T> elements;

  public:
    void push(T const&);
    void pop();
    T top() const;

    bool empty() const {
      return elements.empty();
    }
};

template <class T>
void Stack<T>::push (T const& elem) {
  elements.push_back(elem);
}

template <class T>
void Stack<T>::pop () {
  if (elements.empty()) {
    throw out_of_range("Stack<>::pop(): empty stack");
  }
  
  // remove last element
  elements.pop_back();
}

template <class T>
T Stack<T>::top () const {
  if (elements.empty()) {
    throw out_of_range("Stack<>::top(): empty stack");
  }

  // return copy of last element
  return elements.back();
}

int main() {
  try {
    Stack<int>    intStack;
    Stack<string> stringStack;

    intStack.push(2021);
    cout << intStack.top() << endl;

    stringStack.push("c++ templates<T>");
    cout << stringStack.top() << std::endl;
    stringStack.pop();
    stringStack.pop();

  } catch (exception const& e) {
    cerr << "Exception: " << e.what() << endl;
    return -1;
  }

  return 0;
}

