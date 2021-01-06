# Sample "Guess the number" in FORTRAN

From the article "Learn Forrtan by writing a guess-the-number game". At https://opensource.com/article/21/1/fortran

The original progam asked for user input to provide the seed. But using the time() function is better, since it gets the current unix time integer from the system, and we can set the see with it.

Fortran Time function documentation at https://gcc.gnu.org/onlinedocs/gcc-4.2.4/gfortran/TIME.html

# To compile using the GNU FORTRAN

```
$ gfortran -Wall -o guess guessnum.f
```

