<?php

// Insert new gallery
function insertGallery($name, $location, $openingHours, $contactNumber)
{
    global $pdo;
    $stmt = $pdo->prepare('INSERT INTO Gallery (name, location, opening_hours, contact_number) VALUES (?, ?, ?, ?)');
    $stmt->execute([$name, $location, $openingHours, $contactNumber]);
    return $pdo->lastInsertId();
}

// Update gallery
function updateGallery($galleryId, $name, $location, $openingHours, $contactNumber)
{
    global $pdo;
    $stmt = $pdo->prepare('UPDATE Gallery SET name = ?, location = ?, opening_hours = ?, contact_number = ? WHERE gallery_id = ?');
    $stmt->execute([$name, $location, $openingHours, $contactNumber, $galleryId]);
    return $stmt->rowCount();
}

// Delete gallery
function deleteGallery($galleryId)
{
    global $pdo;
    $stmt = $pdo->prepare('DELETE FROM Gallery WHERE gallery_id = ?');
    $stmt->execute([$galleryId]);
    return $stmt->rowCount();
}

// Insert new artist
function insertArtist($name, $birthDate, $nationality, $contactEmail)
{
    global $pdo;
    $stmt = $pdo->prepare('INSERT INTO Artist (name, birth_date, nationality, contact_email) VALUES (?, ?, ?, ?)');
    $stmt->execute([$name, $birthDate, $nationality, $contactEmail]);
    return $pdo->lastInsertId();
}

// Update artist
function updateArtist($artistId, $name, $birthDate, $nationality, $contactEmail)
{
    global $pdo;
    $stmt = $pdo->prepare('UPDATE Artist SET name = ?, birth_date = ?, nationality = ?, contact_email = ? WHERE artist_id = ?');
    $stmt->execute([$name, $birthDate, $nationality, $contactEmail, $artistId]);
    return $stmt->rowCount();
}

// Delete artist
function deleteArtist($artistId)
{
    global $pdo;
    $stmt = $pdo->prepare('DELETE FROM Artist WHERE artist_id = ?');
    $stmt->execute([$artistId]);
    return $stmt->rowCount();
}

// Insert new exhibition
function insertExhibition($galleryId, $artistId, $title, $startDate, $endDate, $description)
{
    global $pdo;
    $stmt = $pdo->prepare('INSERT INTO Exhibition (gallery_id, artist_id, title, start_date, end_date, description) VALUES (?, ?, ?, ?, ?, ?)');
    $stmt->execute([$galleryId, $artistId, $title, $startDate, $endDate, $description]);
    return $pdo->lastInsertId();
}

// Update exhibition
function updateExhibition($exhibitionId, $galleryId, $artistId, $title, $startDate, $endDate, $description)
{
    global $pdo;
    $stmt = $pdo->prepare('UPDATE Exhibition SET gallery_id = ?, artist_id = ?, title = ?, start_date = ?, end_date = ?, description = ? WHERE exhibition_id = ?');
    $stmt->execute([$galleryId, $artistId, $title, $startDate, $endDate, $description, $exhibitionId]);
    return $stmt->rowCount();
}

// Delete exhibition
function deleteExhibition($exhibitionId)
{
    global $pdo;
    $stmt = $pdo->prepare('DELETE FROM Exhibition WHERE exhibition_id = ?');
    $stmt->execute([$exhibitionId]);
    return $stmt->rowCount();
}
?>