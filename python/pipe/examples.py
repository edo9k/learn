"""
Examples of using the Pipe Python library
"""

# chain
from pipe import chain

years = list([[1984, 1987], [1995, 1998], [2020, 2022]] | chain)

print("chains iterables toguether: ", years)


# chain_with
from pipe import dedup

numbers = list([1, 2, 2, 3, 3, 3, 4, 4, 4, 4] | dedup )

print("removes duplicates: ", numbers)


# map or select
from pipe import map, select

double = list( [ 0, 1, 2, 3 ] | map(lambda x: x * 2) )
triple = list( [ 0, 1, 2, 3 ] | select(lambda x: x * 3) )

print("doubling with map", double)
print("tripling with select", triple)


# permutations

from pipe import permutations

for item in 'ABC' | permutations(2):
    print(item) 

