<?php

$db = new SQLite3(':memory:');

$db->exec("CREATE TABLE friends(id INTEGER PRIMARY KEY, name TEXT)");

$db->exec("INSERT INTO friends(name) VALUES ('Ayanami Rei')   ");
$db->exec("INSERT INTO friends(name) VALUES ('Langley Asuka') ");
$db->exec("INSERT INTO friends(name) VALUES ('Ikari Shinji')  ");

$last_row_id = $db->lastInsertRowID();

echo "The last inserted row has the id ($last_row_id).\n";
