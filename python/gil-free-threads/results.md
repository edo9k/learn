# Simple Benchmark Python 3.13 Global Thread Lock

Obviously this is not scientific or rigorous at all. Just a toy benchmark,
running a Prime number counting algorithm in Python 3.13 with the Global
Interpreter Lock (GIL) vs Python 3.13 with the newly added no-GIL option, which
does away with the lock and allows Python to run with actual fully fledged
threads. 


## Running on Python 3.13 WITH GIL 

Total primes: 123481 
**Time taken: 17.27 seconds**

## Running on Python 3.13 WITHOUT GIL

Total primes: 123481 
**Time taken: 5.24 seconds**

## other info and requirements 

I ran this on a modest AMD Ryzen 5 5500U computer. You also need **podman**
installed to build and run the containers with GIL/no-GIL Python 3.13. 

To use docker, change run.sh and build.sh or do `alias podman=docker`

