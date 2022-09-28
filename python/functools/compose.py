# compose function example from geeksforgeeks.org

from functools import reduce

def compose(*functions):

    def compose_two(f, g):
        return lambda x: f(g(x))

    return reduce(compose_two, functions, lambda x: x)



def add1(x):
    return x + 1

def mul2(x):
    return x * 2

def sub3(x):
    return x - 3


x = add1(2000)
x = mul2(x)
x = sub3(x)

print(f"applying all functions separately: {x}")

# applied in inverse order, so sub3( mul2( add1( x ) ) ) 
composed_fn = compose(sub3, mul2, add1)

y = composed_fn(2000)

print(f"applying composite function with all operations: {y}")

