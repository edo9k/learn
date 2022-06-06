#include <iostream>
#include <chrono>
#include <mutex>
#include <thread>
#include <cstdlib>
#include <ctime>

using namespace std;

void phil(int ph, mutex& ml, mutex& mh, mutex& mo) {
  for (;;) {        // prevent thread from termination
    int duration = rand() % 100 + 1;

    {               // limit scope of lock
      lock_guard<mutex> moGuard(mo);
      cout  << ph << " thinking for " 
            << duration << " milliseconds. " 
            << endl;
    }

    this_thread::sleep_for(chrono::milliseconds(duration));

    {
      lock_guard<mutex> moGuard(mo);
      cout  << "\t\t" 
            << ph << " takes forks " 
            << endl;
    }

    {
      lock_guard<mutex> mlGuard(ml);
      this_thread::sleep_for(chrono::milliseconds(30));
      lock_guard<mutex> mhGuard(mh);
      duration = rand() % 100 + 1;
      {
        lock_guard<mutex> moGuard(mo);
        cout  << "\t\t\t\t" 
              << ph << " eats " 
              << duration << " milliseconds " 
              << endl;
      }

      this_thread::sleep_for(chrono::milliseconds(duration));
    }
  }
}

int main() {
  cout  << "Dining Philosophers, C++ resource hierarchy implementation."      << endl
        << " -- from the wikipedia article \"Dining Philosophers Problem\" "  << endl
        << " -- https://en.wikipedia.org/wiki/Dining_philosophers_problem "   << endl;

  srand(time(nullptr)); 

  mutex m1, m2, m3; // 3 forks, 3 mutexes
  mutex mo;         // for output

  // 3 philosophers, 3 thread
  thread t1( [&] { phil(1, m1, m2, mo); });
  thread t2( [&] { phil(2, m2, m3, mo); });
  thread t3( [&] { phil(3, m1, m3, mo); });

  t1.join();
  t2.join();
  t3.join();

  cout << " -- end of program -- " << endl;

  return 0; 
}

