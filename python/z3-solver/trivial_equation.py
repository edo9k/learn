from z3 import *

x = Int('x')
y = Int('y') 

s = Solver()

s.add(x + y == 10)
s.add(x - y == 2)

if s.check() == sat:
    m = s.model()
    solution = { d.name(): m[d] for d in m}
    print('Solution found') 
    print(solution['x'], solution['y'])
else:
    print('No solution found')
