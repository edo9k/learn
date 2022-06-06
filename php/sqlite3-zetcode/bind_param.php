<?php

$db = new SQLite3(':memory:');

$db->exec("CREATE TABLE friends(id INTEGER PRIMARY KEY, firstname TEXT, lastname TEXT)");

$stm = $db->prepare("INSERT INTO friends(firstname, lastname) VALUES (?, ?)");

$stm->bindParam(1, $firstName);
$stm->bindParam(2, $lastName);

$firstName = "Grace";
$lastName = "Hopper";
$stm->execute();

$firstName = "Peter";
$lastName = "Norvig";
$stm->execute();

$res = $db->query("SELECT * FROM friends");

while ($row = $res->fetchArray())
  print_r($row);


