<?php

$db = new SQLite3('store.db');

$sql = "SELECT name FROM cars WHERE name like '%a%'";

$escaped = SQLite3::escapeString($sql);

var_dump($sql);
var_dump($escaped);

