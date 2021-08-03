/*
 * # install libcgicc3-dev
 * sudo apt install libcgicc-devv
 *
 * # compile adding the lib
 * g++ cgi-libcgicc3-example.cpp -lcgicc
 *
 * # copy to cgi directory
 * # info about that in the other cgi-* examples
 * 
 * #compile and move
 * g++ cgi-libcgicc3-example.cpp -lcgicc && \
 * sudo mv a.out /usr/lib/cgi-bin/cgicc.cgi
 *
 */

#include <iostream>
#include <vector>
#include <string>

#include "cgicc/Cgicc.h"
#include "cgicc/HTTPHTMLHeader.h"
#include "cgicc/HTMLClasses.h"

using namespace std;
using namespace cgicc;

int main() {

  try {
    Cgicc cgi;
    
    // header
    cout << HTTPHTMLHeader() << endl;

    // setup HTML document
    cout << html() << head(title("cgicc example")) << endl;
    cout << body() << endl;

    cout << p("This example prints whatever is send in the url parameter 'name'.") << endl;
    cout << a("Set 'name' param to Anonymous", set("HREF","?name=Anonymous")) << endl;

    // print out submitted element
    form_iterator name = cgi.getElement("name");

    if (name != cgi.getElements().end()) {
      cout << p("Your name: ") << h1(**name) << endl;
    }

    // close html doc
    cout << body() << html();

  } catch (exception& e) {
    cout << "Error: " << e.what() << endl;
  }

  return 0;
}


