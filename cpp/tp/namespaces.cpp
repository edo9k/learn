#include <iostream>

using namespace std;

namespace a {
  void hello() {
    cout << "Hello from namespace (a)." << endl;
  }
}

namespace b {
  void hello() {
    cout << "Hello from namespace (b)." << endl;
  }
}

namespace c {
  void hello() {
    cout << "Hello from namespace (c)." << endl;
  }
}

// define which namespace with a directive
using namespace c;
void callHelloFromNamespaceC() {
  hello();
}

// nested namespaces
namespace parent {
  namespace child {
    void hello() {
      cout << "Hello from a nested namespace (parent(child))." << endl;
    }
  }
}

int main() {

  // from namespace a
  a::hello();

  // from namespace b
  b::hello();

  // from namespace c
  callHelloFromNamespaceC();
  
  // from namespace parent::child
  parent::child::hello();

  return 0;
}

