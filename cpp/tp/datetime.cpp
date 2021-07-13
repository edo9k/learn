#include <iostream>
#include <ctime>

using namespace std;

int main() {
  // system NOW()
  time_t now = time(0);

  // convert to string
  char* local_date_time = ctime(&now);

  // convert to UTC
  tm *utc = gmtime(&now);

  char* utc_date_time = asctime(utc);

  cout << "Since Unix Epoch -> " << now << endl;
  cout << "Local datetime ---> " << local_date_time;
  cout << "In UTC it's ------> " << utc_date_time;

  return 0;
}

