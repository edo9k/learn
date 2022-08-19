from functools import cache

@cache
def factorial(n):
    return n * factorial(n-1) if n else 1 

# mandatory factorial function
# using the cache decorator results are memoized
# eliminating a lot of the operations that make
# this naive implementation bad

print(f"""
        factorial(10) -> { factorial(10) }
        factorial(5)  -> { factorial(5)  }
        factorial(12) -> { factorial(12) }
""")

