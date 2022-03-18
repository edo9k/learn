<?php

$db = new SQLite3('store.db');

$res = $db->query("SELECT * FROM cars WHERE id = 1");
$cols = $res->numColumns();

echo "There are {$cols} columns in the result set. \n";

