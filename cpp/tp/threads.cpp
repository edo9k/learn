#include <iostream>
#include <cstdlib>
#include <pthread.h>

using namespace std;

/*
 *  You need to add the thread library for this on to compile
 *  `g++ multithreading.cpp -lpthread`
 *
 *  But it still throws a warning, saying you're casting a int pointer
 *  to a pointer of a different size. 
 *
 *  This in 2021, with this Linux & GCC versions:
 *
 *  Linux 5.4.0-80-generic #90~18.04.1-Ubuntu SMP Tue Jul 13 19:40:02 UTC 2021 
 *  gcc (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0
 *
 */

#define NUMBER_OF_THREADS 30

void *hi(void *threadid) {
  long tid = (long) threadid;

  cout << "Hi from Thread ID " << tid << endl;
  pthread_exit(NULL);
}

int main() {
  pthread_t threads[NUMBER_OF_THREADS];
  int rc;
  int i;

  for (i = 0; i < NUMBER_OF_THREADS; i++ ) {
    cout << "thread created from <main> function [" << i << "]" << endl;
    rc = pthread_create(&threads[i], NULL, hi, (void *)i);

    if (rc) {
      cout << "Error: unable to create thread -> " << rc << endl;
      exit(-1);
    }
  }

  pthread_exit(NULL);
}

