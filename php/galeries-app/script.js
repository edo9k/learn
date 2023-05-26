// Gallery Form
function showGalleryForm() {
    document.getElementById('galleryModal').style.display = 'block';
}

function hideGalleryForm() {
    document.getElementById('galleryModal').style.display = 'none';
}

// Artist Form
function showArtistForm() {
    document.getElementById('artistModal').style.display = 'block';
}

function hideArtistForm() {
    document.getElementById('artistModal').style.display = 'none';
}

// Exhibition Form
function showExhibitionForm() {
    document.getElementById('exhibitionModal').style.display = 'block';
}

function hideExhibitionForm() {
    document.getElementById('exhibitionModal').style.display = 'none';
}

// Handle form submissions
document.getElementById('galleryForm').addEventListener('submit', function (e) {
    e.preventDefault();
    const name = document.getElementById('galleryName').value;
    const location = document.getElementById('galleryLocation').value;
    const openingHours = document.getElementById('galleryOpeningHours').value;
    const contactNumber = document.getElementById('galleryContactNumber').value;

    // Call insertGallery function with the form values
    insertGallery(name, location, openingHours, contactNumber)
        .then(() => {
            // Refresh the gallery list
            getGalleryList();
            // Clear the form
            document.getElementById('galleryForm').reset();
            // Hide the form modal
            hideGalleryForm();
        })
        .catch((error) => {
            console.error(error);
        });
});

document.getElementById('artistForm').addEventListener('submit', function (e) {
    e.preventDefault();
    const name = document.getElementById('artistName').value;
    const birthDate = document.getElementById('artistBirthDate').value;
    const nationality = document.getElementById('artistNationality').value;
    const contactEmail = document.getElementById('artistContactEmail').value;

    // Call insertArtist function with the form values
    insertArtist(name, birthDate, nationality, contactEmail)
        .then(() => {
            // Refresh the artist list
            getArtistList();
            // Clear the form
            document.getElementById('artistForm').reset();
            // Hide the form modal
            hideArtistForm();
        })
        .catch((error) => {
            console.error(error);
        });
});

document.getElementById('exhibitionForm').addEventListener('submit', function (e) {
    e.preventDefault();
    const galleryId = document.getElementById('gallerySelect').value;
    const artistId = document.getElementById('artistSelect').value;
    const title = document.getElementById('exhibitionTitle').value;
    const startDate = document.getElementById('exhibitionStartDate').value;
    const endDate = document.getElementById('exhibitionEndDate').value;
    const description = document.getElementById('exhibitionDescription').value;

    // Call insertExhibition function with the form values
    insertExhibition(galleryId, artistId, title, startDate, endDate, description)
        .then(() => {
            // Refresh the exhibition list
            getExhibitionList();
            // Clear the form
            document.getElementById('exhibitionForm').reset();
            // Hide the form modal
            hideExhibitionForm();
        })
        .catch((error) => {
            console.error(error);
        });
});

// Fetch gallery list
function getGalleryList() {
    // Call a server-side script to fetch the gallery list from the database
    // and return the result as JSON
    return fetch('getGalleryList.php')
        .then((response) => response.json())
        .then((data) => {
            const galleryList = document.getElementById('galleryList');
            galleryList.innerHTML = '';

            // Loop through the gallery data and create HTML elements to display them
            data.forEach((gallery) => {
                const galleryItem = document.createElement('div');
                galleryItem.innerHTML = `<strong>${gallery.name}</strong> - ${gallery.location}`;
                galleryList.appendChild(galleryItem);
            });
        })
        .catch((error) => {
            console.error(error);
        });
}

// Fetch artist list
function getArtistList() {
    // Call a server-side script to fetch the artist list from the database
    // and return the result as JSON
    return fetch('getArtistList.php')
        .then((response) => response.json())
        .then((data) => {
            const artistList = document.getElementById('artistList');
            artistList.innerHTML = '';

            // Loop through the artist data and create HTML elements to display them
            data.forEach((artist) => {
                const artistItem = document.createElement('div');
                artistItem.innerHTML = `<strong>${artist.name}</strong> - ${artist.nationality}`;
                artistList.appendChild(artistItem);
            });
        })
        .catch((error) => {
            console.error(error);
        });
}

// Fetch exhibition list
function getExhibitionList() {
    // Call a server-side script to fetch the exhibition list from the database
    // and return the result as JSON
    return fetch('getExhibitionList.php')
        .then((response) => response.json())
        .then((data) => {
            const exhibitionList = document.getElementById('exhibitionList');
            exhibitionList.innerHTML = '';

            // Loop through the exhibition data and create HTML elements to display them
            data.forEach((exhibition) => {
                const exhibitionItem = document.createElement('div');
                exhibitionItem.innerHTML = `<strong>${exhibition.title}</strong> - ${exhibition.gallery_name} (${exhibition.artist_name})`;
                exhibitionList.appendChild(exhibitionItem);
            });
        })
        .catch((error) => {
            console.error(error);
        });
}

// Fetch gallery and artist lists when the page loads
document.addEventListener('DOMContentLoaded', function () {
    getGalleryList();
    getArtistList();
    getExhibitionList();
});
