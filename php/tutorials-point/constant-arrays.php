<?php

echo "constant arrays can be created with the `define` function\n";

define( 'languages', [
  'c',
  'haskell',
  'pascal',
  'javascript',
  'php',
  'python',
  'c++'
]);


echo "language in position (4) -> ". languages[4] ."\n\n";

echo "constants are not preceded by a dollar sign in php $\n";
echo "complete content of constant array `languages`\n";
echo "[ ". implode(', ', languages) ." ] \n";
