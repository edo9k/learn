# benchmark.py
import time
from threading import Thread

def is_prime(n):
    if n <= 1:
        return False
    if n == 2:
        return True
    if n % 2 == 0:
        return False
    for i in range(3, int(n**0.5)+1, 2):
        if n % i == 0:
            return False
    return True

def count_primes_in_range(start, end):
    count = 0
    for n in range(start, end):
        if is_prime(n):
            count += 1
    return count

def worker(start, end, results, index):
    results[index] = count_primes_in_range(start, end)

def main():
    RANGE_START = 10_000_000
    RANGE_END = 12_000_000
    THREADS = 4

    chunk_size = (RANGE_END - RANGE_START) // THREADS
    threads = []
    results = [0] * THREADS

    start_time = time.perf_counter()

    for i in range(THREADS):
        start = RANGE_START + i * chunk_size
        end = start + chunk_size if i < THREADS - 1 else RANGE_END
        t = Thread(target=worker, args=(start, end, results, i))
        threads.append(t)
        t.start()

    for t in threads:
        t.join()

    end_time = time.perf_counter()
    total_primes = sum(results)

    print(f"Total primes: {total_primes}")
    print(f"Time taken: {end_time - start_time:.2f} seconds")

if __name__ == "__main__":
    main()

