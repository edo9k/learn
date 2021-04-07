<?php

class A {
  public $prop1;
}

class B {
  public $prop2;
}

$a = new A();
$a->prop1 = 2021;

$b = new B();
$b->prop2 = 2022;

$serialize_a = serialize($a);
$serialize_b = serialize($b);

$data_a = unserialize($serialize_a, ["allowed_classes" => true]);
$data_b = unserialize($serialize_b, ["allowed_classes" => ["A", "B"]]);


echo "serialize and unserialize can convert object to strings and back again.\n";
echo "sort of like JSON.parse and JSON.stringify in Javascript.\n";

echo "$serialize_a \n";
echo "$serialize_b \n";

echo "$data_a->prop1 \n";
echo "$data_b->prop2 \n";

