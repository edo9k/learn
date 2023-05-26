-- Create Gallery table
CREATE TABLE Gallery (
    gallery_id INTEGER PRIMARY KEY,
    name TEXT,
    location TEXT,
    opening_hours TEXT,
    contact_number TEXT
);

-- Create Artist table
CREATE TABLE Artist (
    artist_id INTEGER PRIMARY KEY,
    name TEXT,
    birth_date TEXT,
    nationality TEXT,
    contact_email TEXT
);

-- Create Exhibition table
CREATE TABLE Exhibition (
    exhibition_id INTEGER PRIMARY KEY,
    gallery_id INTEGER,
    artist_id INTEGER,
    title TEXT,
    start_date TEXT,
    end_date TEXT,
    description TEXT,
    FOREIGN KEY (gallery_id) REFERENCES Gallery (gallery_id),
    FOREIGN KEY (artist_id) REFERENCES Artist (artist_id)
);
