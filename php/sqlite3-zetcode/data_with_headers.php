<?php

$db = new SQLite3('store.db');

$res = $db->query("SELECT * FROM cars");

$col1 = $res->columnName(1);
$col2 = $res->columnName(2);

$header = sprintf("%-25s %s\n", $col1, $col2);

echo $header;

while ($row = $res->fetchArray()) {
  $line = sprintf("%-25s %s\n", $row[1], $row[2]);
  echo $line;
}

