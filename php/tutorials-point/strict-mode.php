<?php

declare(strict_types = 1);
// whole file has strict type checking now.
// and this can only be set once per file.
// the declaration mus be the first non-comment
// line of the code.

function sum(int ...$elements) {
  return array_sum($elements);
}

echo "Runs ok, because all arguments are int: \n";
echo "sum(1, 2, 3, 4, 5) -> ". sum(1, 2, 3, 4, 5) ."\n\n";

echo "Throws an error because an argument is a string: \n\n";
echo "sum(1, 2, 3, 4, '5') -> ". sum(1, 2, 3, 4, '5') ."\n\n";

// comment out the `declare(strict_types = 1);` line will 
// cause both call to respond with the result 15. 
// without strict typing, the interpreter will convert the '5'
// to an integer, and sum with the other arguments of fn call. 

