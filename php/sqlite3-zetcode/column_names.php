<?php

$db = new SQLite3('store.db');

$res = $db->query("PRAGMA table_info(cars)");

while ($row = $res->fetchArray(SQLITE3_NUM)) {
  echo "{$row[0]} {$row[1]} {$row[2]} \n";
}

