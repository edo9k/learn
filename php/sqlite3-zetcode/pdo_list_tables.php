<?php

$pdo = new PDO('sqlite:store.db');

$stm  = $pdo->query("SELECT * FROM cars");
$rows = $stm->fetchAll(PDO::FETCH_NUM);

foreach($rows as $row) {
  printf("$row[0] $row[1] $row[2] \n");
}

