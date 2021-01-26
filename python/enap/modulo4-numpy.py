#!/usr/bin/python3

import numpy as np

u = np.array([1, 2, 3])
v = np.array([4, 5, 6])

print("""
    Adding two vectors (u+v): {}
    Adding a scalar to vector (u+4): {}
    Multiplying vector by a scalar (u*4): {}
    Multiplying two vectors: {}
    Vector sum: {}
    Dot product: {}
""".format(
    u+v,
    u+4,
    u*4,
    u*v,
    np.sum(u*v),
    np.dot(u,v)
))

