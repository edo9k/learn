/*
 *  How to run the binary through CGI on Apache2 
 *
 *  # activate the cgi flag
 *  sudo a2emod cgi
 *  sudo service apache2 restart
 *
 *  # and copy file
 *  sudo cp index.cgi /usr/lib/cgi-bin/
 *
 */

#include <iostream>
#include <stdlib.h>

using namespace std;

const string ENV[24] = {
  "COMSPEC",              "DOCUMENT_ROOT",        "GATEWAY_INTERFACE",    
  "HTTP_ACCEPT",          "HTTP_ACCEPT_ENCODING", "HTTP_ACCEPT_LANGUAGE", 
  "HTTP_CONNECTION",      "HTTP_HOST",            "HTTP_USER_AGENT", "PATH",
  "QUERY_STRING",         "REMOTE_ADDR",          "REMOTE_PORT",
  "REQUEST_METHOD",       "REQUEST_URI",          "SCRIPT_FILENAME",
  "SCRIPT_NAME",          "SERVER_ADDR",          "SERVER_ADMIN",
  "SERVER_NAME",          "SERVER_PORT",          "SERVER_PROTOCOL",
  "SERVER_SIGNATURE",     "SERVER_SOFTWARE"
};

int main () {
  cout  << "Content-type:text/html\r\n\r\n" 
        << "<html>\n"
        << "<head>\n"
        << "<title>CGI Env Dump</title>\n"
        << "</head>\n"
        << "<body>\n"
        << "<table border=0 cellspacing=2>";

  for (int i = 0; i < 24; i++) {
    cout << "<tr><td>" << ENV[ i ] << "</td><td>";

    // get environment variable
    char *value = getenv( ENV[ i ].c_str() );

    if (value != 0) cout << value;
    else cout << "<undefined>";

    cout << "</td></tr>\n";
  }

  cout << "</table>\n</body>\n</html>\n";

  return 0;
}
