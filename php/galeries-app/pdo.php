<?php

function getPdoInstance()
{
    // Database credentials


    // Determine the relative path to the SQLite database file
    $relativePath = 'galeries.db';

    // Get the absolute path to the SQLite database file
    $absolutePath = __DIR__ . '/' . $relativePath;

    // Create the PDO connection string
    $dsn = 'sqlite:' . $absolutePath;

    // Create a PDO instance
    $pdo = new PDO($dsn); 

    // Set PDO error mode to exception
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    return $pdo;
}

?>

