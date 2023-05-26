<?php


function getExhibitionList()
{

    global $pdo;

    // Fetch exhibition list from the database
    $stmt = $pdo->query('SELECT e.exhibition_id, e.title, g.name AS gallery_name, a.name AS artist_name
                    FROM Exhibition e
                    INNER JOIN Gallery g ON e.gallery_id = g.gallery_id
                    INNER JOIN Artist a ON e.artist_id = a.artist_id');
    $exhibitionList = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Return the exhibition list as JSON
    header('Content-Type: application/json');
    return json_encode($exhibitionList);
}

?>