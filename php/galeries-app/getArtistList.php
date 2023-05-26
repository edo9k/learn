<?php

function getArtistList()
{

    global $pdo;

    // Fetch artist list from the database
    $stmt = $pdo->query('SELECT * FROM Artist');
    $artistList = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Return the artist list as JSON
    header('Content-Type: application/json');
    return json_encode($artistList);
}
?>