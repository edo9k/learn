from functools import reduce 

numbers = list( range(1, 100) ) 

total = reduce( lambda a, b: a + b, numbers )

print(f"""
    simplest use of a reduce function.
    getting the sum of all numbers between a and b.
    sum of range 1..100 -> { total }
""")

