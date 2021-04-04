<?php

declare(strict_types = 1);

function int_add_one(int $n): int {
  return $n + 1;
}

function float_add_one(float $n): float {
  return $n + 1;
}


echo "both will run, arguments are of the expected type. \n";
echo "int_add_one(1)     -> ". int_add_one(1)     ."\n";
echo "float_add_one(1.1) -> ". float_add_one(1.1) ."\n\n";

echo "will still run, even though the expected arg is float,\n";
echo "but the given one is integer. no error since there's no \n";
echo "precision loss.\n";
echo "float_add_one(1) -> ". float_add_one(1) ."\n\n";

echo "the opposite is not true, int_add_one will throw and error \n";
echo "if the given argument is a float. because on coverting to int \n";
echo "precision would be lost. therefore, error: \n\n";
echo int_add_one(1.1) ."\n";

