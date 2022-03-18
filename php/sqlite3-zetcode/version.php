<?php 

echo "\n"; 
echo "-- Getting SQLite version via PHP functions \n";

$sqlite_version = SQLite3::version();

echo "SQLite version: " . $sqlite_version['versionString'] . "\n";
echo "SQLite number:  " . $sqlite_version['versionNumber'] . "\n";

var_dump($sqlite_version);


/* ----- */ 


echo "\n"; 
echo "-- Getting SQLite version via SQLite query \n";

$db = new SQLite3('store.db');

$version = $db->querySingle('select sqlite_version()');

echo $version . "\n";

echo "\n";

