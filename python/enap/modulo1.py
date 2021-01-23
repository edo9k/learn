#!/usr/bin/python3

# numbers and shit
width = 10
height = 5
area = 0

# printing with `format` you can do a bunch of stuff 
print("Width: {}, Height: {}, Area: {}".format(width, height, area))

# the `type` is just like `typeof` in Javascript
print("The type of Width is {}".format(type(width)))
print("-" * 20)

# all the usual maths stuff
a = 6
b = 9

print("For Math, we're using numbers (a): {}, and (b): {}".format(a,b))
print("Addition       (+): {}".format(a+b))
print("Subtraction    (-): {}".format(a-b))
print("Multiplication (*): {}".format(a*b))
print("Division       (/): {}".format(a/b))
print(" --- the previous operation goes wrong because a&b are int type")
print(" --- if we cast them to float: ")
print("Division       (/): {}".format(float(a)/b))
print("-" * 20) 


