<?php 

$db = new SQLite3(':memory:');

$db->exec("CREATE TABLE books(id INTEGER PRIMARY KEY, title TEXT)");

$db->exec("INSERT INTO books (title) VALUES ('SICP')");
$db->exec("INSERT INTO books (title) VALUES ('The C Programming Language')");
$db->exec("INSERT INTO books (title) VALUES ('The Art of Computer Programming')");
$db->exec("INSERT INTO books (title) VALUES ('Homotopy Type Theory')");

$db->exec("DELETE FROM books");

$changes = $db->changes();

echo "The DELETE statement removed $changes rows. \n";

