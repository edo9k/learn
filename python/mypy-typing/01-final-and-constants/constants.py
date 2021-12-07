from typing_extensions import Final 


print('''

mypy let's you declare constants using the keyword "Final" 
from the package `typing_extensions`. 

the regular interpreter will ignore changes to the constant,
but the mypy static checker will show the error. 

$ python myfile.py  # runs normally
$ mypy   myfile.py  # -> error: Cannot assign to final name <variable>

''')

DAYS_IN_A_WEEK: Final = 7 # our constant

DAYS_IN_A_WEEK = 8

print( DAYS_IN_A_WEEK )
