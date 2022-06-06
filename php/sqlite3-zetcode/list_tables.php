<?php

$db = new SQLite3('store.db');

$res = $db->query("SELECT name FROM sqlite_master WHERE type='table'");

while ($row = $res->fetchArray(SQLITE3_NUM)) {
  echo "{$row[0]} \n";
}

