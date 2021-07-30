/*
 * compile with pthread lib
 *
 * g++ threads-join-detach.cpp -lpthread
 *
 *
 * this raises warning, comment on threads.cpp
 */

#include <iostream> 
#include <cstdlib>
#include <pthread.h>
#include <unistd.h>

using namespace std;

#define NUMBER_OF_THREADS 16

void *wait(void *t) {
  int i;
  long tid;

  tid = (long)t;

  cout << "sleeping... (thread id: " << tid << ")" << endl;
  sleep(1);

  cout << "exiting...  (thread id: " << tid << ")" << endl;
  pthread_exit(NULL);
}

int main() {
  int rc;
  pthread_t threads[NUMBER_OF_THREADS];
  pthread_attr_t attr;
  void *status;

  pthread_attr_init(&attr);
  pthread_attr_setdetachstate(&attr, PTHREAD_CREATE_JOINABLE);

  for (int i = 0; i < NUMBER_OF_THREADS; i++) {
    cout << "creating thread from <main> #" << i << endl;
    rc = pthread_create(&threads[i], &attr, wait, (void *)i );

    if (rc) {
      cout << "error: unable to create thread -> " << rc << endl;
      exit(-1);
    }
  }

  pthread_attr_destroy(&attr);

  for (int i = 0; i < NUMBER_OF_THREADS; i++) {
    rc = pthread_join(threads[i], &status);

    if (rc) {
      cout << "error: unable to join -> " << rc << endl;
      exit(-1);
    }

    cout << "main: thread #" << i << " exited with status #" << status << endl;
  }

  cout << "main: program end run." << endl;
  pthread_exit(NULL);
}

