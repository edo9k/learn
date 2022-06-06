<?php 

require( __DIR__ . '/car_dummy.php');

$db = new SQLite3('store.db');

$db->exec("CREATE TABLE IF NOT EXISTS cars(id INTEGER PRIMARY KEY, name TEXT, price INT)");

$db->exec("INSERT INTO cars(name, price) VALUES('" . carName() . "', " . carPrice() . ")"); // not safe
$db->exec("INSERT INTO cars(name, price) VALUES('" . carName() . "', " . carPrice() . ")"); // not safe
$db->exec("INSERT INTO cars(name, price) VALUES('" . carName() . "', " . carPrice() . ")"); // not safe
$db->exec("INSERT INTO cars(name, price) VALUES('" . carName() . "', " . carPrice() . ")"); // not safe


//echo "car name: " . carName() . " price: " . carPrice() . "\n";


