#include <iostream>
#include <csignal>

#ifdef WIN32
#include <Windows.h>
#else
#include <unistd.h>
#endif

using namespace std;

void signalHandler(int signum) {
  cout << "Interrupt signal (" << signum << ") received." << endl;

  exit(signum);
}

int main() {
  signal(SIGINT, signalHandler);

  int counter = 0;

  while (1) {
    cout << "Going to sleep..." << endl;
    sleep(1);

    counter++;

    if (counter == 10)
      raise( SIGINT );
  }

  return 0;
}

