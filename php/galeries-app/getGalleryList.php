<?php


function getGalleryList()
{
    global $pdo;

    // Fetch gallery list from the database
    $stmt = $pdo->query('SELECT * FROM Gallery');
    $galleryList = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Return the gallery list as JSON
    header('Content-Type: application/json');
    return json_encode($galleryList);
}
?>