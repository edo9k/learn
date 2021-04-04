<?php

$meaning = [ 
  -1 => ' (a >  b)',
   0 => ' (a == b)',
   1 => ' (a <  b)'
 ];

$a = -10; $b = 100;

echo "the spaceship operator will return -1, 0 or 1 when comparing two values.\n";
echo "-1 when the first value is less than the second.\n";
echo " 0 when the first value is equal to the second.\n";
echo " 1 when the first value is greater than the second.\n\n";


echo "$a <=> $b will return ". ($a <=> $b) ." ". $meaning[($a <=> $b)] ."\n";
echo "$b <=> $b will return ". ($b <=> $b) ." ". $meaning[($b <=> $b)] ."\n";
echo "$b <=> $a will return ". ($b <=> $a) ." ". $meaning[($b <=> $a)] ."\n";

$a = 'a'; $b = 'b';
echo "\nit also works for characters\n";
echo "$a <=> $b will return ". ($a <=> $b) ." ". $meaning[($a <=> $b)] ."\n";
echo "$b <=> $b will return ". ($b <=> $b) ." ". $meaning[($b <=> $b)] ."\n";
echo "$b <=> $a will return ". ($b <=> $a) ." ". $meaning[($b <=> $a)] ."\n";

$a = -0.16; $b = 0.255;
echo "\nworks for float too\n";
echo "$a <=> $b will return ". ($a <=> $b) ." ". $meaning[($a <=> $b)] ."\n";
echo "$b <=> $b will return ". ($b <=> $b) ." ". $meaning[($b <=> $b)] ."\n";
echo "$b <=> $a will return ". ($b <=> $a) ." ". $meaning[($b <=> $a)] ."\n";

