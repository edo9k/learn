<?php

$db = new SQLite3('store.db');

$res = $db->query('SELECT * FROM cars');

while ($row = $res->fetchArray()) {
  echo "{$row['id']} {$row['name']} {$row['price']} \n";
}

