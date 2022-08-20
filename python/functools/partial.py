
from functools import partial

def sum3(a, b, c):
    return a + b + c


partial_a = partial(sum3, 600)
partial_b = partial(partial_a, 60)
result = partial_b(6) 

print(f"""
    sum3 takes three parameters, like 1 + 2 + 3 {sum3(1, 2, 3)}

    with partial we can partially apply the function

    partially applying sum3(600, _, _) gives us a new function
    that takes the two remaining parameters. 

    we can partially apply it again, and get another function that
    gets the last parameter before returning the sum. 

    partially apply 600 we get function {partial_a}
    partially apply  60 we get function {partial_b}
    call it with the last parameter, and we get
    the result: {result} 

    we could do the same, less elegantly in python, using
    a bunch of lambdas.

    lamba a: lambda b: lambda c: a + b + c

    a bit better in javascript:

    const sum = a => b => c => a + b + c 

    and in haskell you there's no need to do anything because all
    functions are curried by default.

    so:

    sum a b c = a + b + c 

    can be partially applied in any way you feel like. 

""")

