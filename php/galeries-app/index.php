<?php

// db driver to sqlite
ini_set('extension', 'custom.ini');

// Include the necessary PHP files
require 'pdo.php';
require 'getArtistList.php';
require 'getExhibitionList.php';
require 'getGalleryList.php';  

// Get the PDO instance
global $pdo; 
$pdo = getPdoInstance();

// Get gallery list
$galleryList = getGalleryList();

// Get artist list
$artistList = getArtistList();

// Get exhibition list
$exhibitionList = getExhibitionList();

// Output the results
?>

<!DOCTYPE html>
<html>
<head>
    <title>Gallery Exhibition</title>
</head>
<body>
    <h1>Gallery Exhibition</h1>

    <h2>Galleries</h2>
    <ul>
        <?php foreach ($galleryList as $gallery) : ?>
            <li><?= $gallery['name'] ?></li>
        <?php endforeach; ?>
    </ul>

    <h2>Artists</h2>
    <ul>
        <?php foreach ($artistList as $artist) : ?>
            <li><?= $artist['name'] ?></li>
        <?php endforeach; ?>
    </ul>

    <h2>Exhibitions</h2>
    <ul>
        <?php foreach ($exhibitionList as $exhibition) : ?>
            <li><?= $exhibition['title'] ?> - <?= $exhibition['gallery_name'] ?> (<?= $exhibition['artist_name'] ?>)</li>
        <?php endforeach; ?>
    </ul>
</body>
</html>
