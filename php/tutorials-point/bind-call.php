<?php

class Example {
  private $year = 2021;
}

$get_year = function() {
  return $this->year ." <- returned from the object closure";
}; /* <- requiring a semicolomn here is just crappy. */

echo "PHP 7 has a 'call' function, much like Javascript's call/bind functions.\n";
echo "Allowing you to inject a function the another object or closure context.\n";
print($get_year->call(new Example));
echo "\n\n";

echo "You can still use bindTo, that returns a bound function. Seems to be JS like.\n";

$bound = $get_year->bindTo(new Example, 'Example');
print($bound() ."\n\n");

echo "There's also a `Closure::bind` function, that is the static version of `bindTo`.";

echo "\n\n";
