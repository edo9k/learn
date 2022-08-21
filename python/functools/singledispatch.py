
from functools import singledispatch 


print("""
        functools.singledispatch allows function behavior
        to depend on argument type. allowing some kind of 
        overload to the same function name.
""")


@singledispatch
def fun(arg):
    print("(base function)")


@fun.register
def _(arg: int):
    print(f"function called with an int argument -> {arg}")


@fun.register
def _(arg: list):
    print(f"function called with a list argument -> {arg}")

fun(2022)           # <- handled by the int function
fun([2, 0, 2, 2])   # <- handled by the list function
fun("some text")    # <- the base function catches any type not registered.

