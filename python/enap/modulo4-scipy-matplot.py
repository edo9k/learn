#!/usr/bin/python3

import scipy.optimize as opt
import numpy as np
import matplotlib.pyplot as plt

# raw data from example
I = [4.0,   3.5,    3.0,    2.5,    2.0]
B = [1.31,  1.14,   0.97,   0.81,   0.76]

IError = [0.2,  0.2,  0.2,  0.2,  0.2]
BError = [0.03, 0.02, 0.04, 0.02, 0.05]

print("estimated B for each error \n")
for i in range(5):
    print("{} +- {} -> {} +- {}".format( I[i], IError[i], B[i], BError[i] ))

# convert raw into n-dimensional matrix (numpy)
# this is a requirement for using scipy optimization
xdata = np.array(I)
ydata = np.array(B)
xerror = np.array(IError)
yerror = np.array(BError)

# linear fitting function
def f(h, m, b):
    return m * h + b

# w gives estimated parameter for m and b, stored in the matrix(w,u) 
# the missing _ returns info about vaciance and covariance

# w is a matrix with info about slope value and y-intercept
w, u = opt.curve_fit(f, xdata, ydata)

# find best line-fit by applying x coordinates and optimized result
yfit = f(xdata, *w)

# graphing the result with matplotlib
# 1. graph error bars for each x
# 2. graph line of best fit

plt.errorbar(I, B, xerr=IError, yerr=BError, fmt='o', ms=3)
plt.plot(xdata, yfit, label="Fit", linewidth=1.5, linestyle='dashed')

# titles and labels
plt.title("I vs. B of the Electromagnet")
plt.xlabel("Electromagnet Current I (A)")
plt.ylabel("Magnetic Field B (T)")

print("""
 Estimated parameters of m and b: {}
 Estimated variance of m and b: {}
""".format( w, np.sqrt(np.diag(u))))

# you could save the graph to the disk with the following line
# -> plt.savefig('I-vs-B.jpg')

# show graph
plt.show()

