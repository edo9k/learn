-- Populate Gallery table
INSERT INTO Gallery (name, location, opening_hours, contact_number) VALUES
    ('Art Gallery A', 'New York', '9 AM - 6 PM', '123-456-7890'),
    ('Modern Art Gallery', 'London', '10 AM - 7 PM', '987-654-3210'),
    ('Contemporary Art Space', 'Paris', '11 AM - 8 PM', '456-123-7890'),
    ('Gallery of Fine Arts', 'Tokyo', '9:30 AM - 5:30 PM', '789-123-4560'),
    ('Sculpture Gallery', 'Berlin', '12 PM - 9 PM', '321-654-9870');

-- Populate Artist table
INSERT INTO Artist (name, birth_date, nationality, contact_email) VALUES
    ('John Smith', '1980-05-15', 'American', 'johnsmith@example.com'),
    ('Emma Johnson', '1992-10-22', 'British', 'emmajohnson@example.com'),
    ('Pierre Dupont', '1975-03-10', 'French', 'pierredupont@example.com'),
    ('Yuki Tanaka', '1988-08-02', 'Japanese', 'yukitanaka@example.com'),
    ('Anna Müller', '1995-11-27', 'German', 'annamuller@example.com');

-- Populate Exhibition table
INSERT INTO Exhibition (gallery_id, artist_id, title, start_date, end_date, description) VALUES
    (1, 1, 'Abstract Expressionism', '2023-06-01', '2023-06-30', 'Exploring the depth of emotions through abstract art.'),
    (2, 2, 'Contemporary Perspectives', '2023-07-05', '2023-07-20', 'Showcasing the latest works of emerging artists.'),
    (3, 3, 'Impressionist Landscapes', '2023-06-15', '2023-07-15', 'Capturing the beauty of nature through vibrant brushstrokes.'),
    (4, 4, 'Traditional Japanese Art', '2023-07-10', '2023-08-10', 'Honoring the rich cultural heritage of Japan.'),
    (5, 5, 'Sculpture Symposium', '2023-06-20', '2023-07-05', 'Featuring innovative sculptures by renowned artists.'),
    (1, 3, 'Mixed Media Fusion', '2023-07-15', '2023-08-15', 'Pushing the boundaries of art by combining diverse mediums.'),
    (2, 4, 'Minimalist Abstractions', '2023-06-10', '2023-07-10', 'Simplifying forms to evoke contemplation and introspection.'),
    (3, 2, 'Portraits of Identity', '2023-06-25', '2023-07-25', 'Exploring the complexity of individuality through portraiture.'),
    (4, 5, 'Kinetic Art Installation', '2023-07-20', '2023-08-20', 'Engaging viewers through interactive and moving sculptures.'),
    (5, 1, 'Neo-Expressionist Explorations', '2023-06-05', '2023-07-05', 'Expressing raw emotions through bold and energetic brushwork.');
