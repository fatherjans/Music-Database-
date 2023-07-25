/*Create a database*/
CREATE DATABASE Music;

/*Enter into a database*/
USE Music;

/* Create Users Table */
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
/* Insert values into users table */
INSERT INTO users (username, password, email)
VALUES
('Binzy.Toothill', 'Binzy', 'binzy.toothill@email.com'),
('Zoofy.Boboborn', 'Zoofy', 'zoofy.boboborn@email.com'),
('Tumzy.Woofborn', 'Tumzy', 'tumzy.woofborn@email.com'),
('Fluff.Figby', 'Fluff', 'fluff.figby@email.com'),
('Draco.Unova', 'Draco', 'draco.unova@email.com');

/* Add a profile photo for each user */
ALTER TABLE users
MODIFY COLUMN profile_image BLOB;
/* Update to add profile images of users */
UPDATE users
SET profile_image = 
    CASE
        WHEN id = 1 THEN CONVERT(_binary'https://www.publicdomainpictures.net/pictures/440000/t2/katzen-vintage-illustration-kunst-1645092656Cbx.jpg' USING utf8mb4)
        WHEN id = 2 THEN CONVERT(_binary'https://as2.ftcdn.net/jpg/03/03/62/45/220_F_303624505_u0bFT1Rnoj8CMUSs8wMCwoKlnWlh5Jiq.jpg' USING utf8mb4)
        WHEN id = 3 THEN CONVERT(_binary'https://as2.ftcdn.net/jpg/02/66/72/41/220_F_266724172_Iy8gdKgMa7XmrhYYxLCxyhx6J7070Pr8.jpg' USING utf8mb4)
        WHEN id = 4 THEN CONVERT(_binary'https://as1.ftcdn.net/jpg/02/85/73/78/220_F_285737865_FVbkYfyDTEUTcMHs1YgeR8ZfC8PwyFP3.jpg' USING utf8mb4)
        WHEN id = 5 THEN CONVERT(_binary'https://as1.ftcdn.net/jpg/02/27/76/44/220_F_227764486_nAcFB4FnDTiyk0WLgKBXArOsqaUCuk7X.jpg' USING utf8mb4)
        ELSE NULL
    END;

/* Create favorite_artists table */
CREATE TABLE favorite_artists (
    user_id INT NOT NULL,
    artist_id INT NOT NULL,
    artist_name VARCHAR(255) NOT NULL,
    user_name VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (artist_id) REFERENCES artists(id),
    INDEX idx_user_id (user_id),
    INDEX idx_artist_id (artist_id)
);
/*Join favorite_artists users table*/
UPDATE favorite_artists AS fa
JOIN users AS u ON fa.user_id = u.id
SET fa.user_name = u.username;
/* Insert values in favorite_values table */
INSERT INTO favorite_artists (user_id, artist_id)
VALUES 
(1, 10),  -- User ID 1's favorite artist is Artist ID 10 Kendrick Lamar
(2, 7),   -- User ID 2's favorite artist is Artist ID 7 Micheal Jackson
(3, 4),   -- User ID 3's favorite artist is Artist ID 4 Bad Bunny
(4, 3),   -- User ID 4's favorite artist is Artist ID 3 Rihanna
(5, 1);   -- User ID 5's favorite artist is Artist ID 1 Kali Uchis

/* Create artists table */
CREATE TABLE artists (
    id INT PRIMARY KEY AUTO_INCREMENT,
    artist_id INT NOT NULL,
    artist_name VARCHAR(255) NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES artist_names(id),
    INDEX idx_artist_id (artist_id),
    INDEX idx_artist_name (artist_name)
);
/* Insert values into artists table */
INSERT INTO artists
VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10);

/* Create artist_names table */
CREATE TABLE artist_names (
    id INT PRIMARY KEY AUTO_INCREMENT,
    artist_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES artists(id),
    INDEX idx_artist_id (artist_id),
	CONSTRAINT unique_name_constraint UNIQUE (name)
);
/* Insert values into artist_names table */
INSERT INTO artist_names (artist_id, name)
VALUES 
(1, 'Kali Uchis'),
(2, 'Justin Bieber'),
(3, 'Rihanna'),
(4, 'Bad Bunny'),
(5, 'Lady Gaga'),
(6, 'Queen'),
(7, 'Michael Jackson'),
(8, 'Taylor Swift'),
(9, 'Don Toliver'),
(10, 'Kendrick Lamar');

/* Create albums table */
CREATE TABLE albums (
    id INT PRIMARY KEY AUTO_INCREMENT,
    artist_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    release_year INT NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES artists(id),
    INDEX idx_artist_id (artist_id),
	CONSTRAINT unique_title_constraint UNIQUE (title)
);
/* Insert values into albums table */
INSERT INTO albums (artist_id, title, release_year) 
VALUES 
(1, 'Red Moon in Venus', 2023),
(2, 'Believe', 2012),
(3, 'Anti', 2016),
(4, 'Un Verano Sin Ti', 2022),
(5, 'The Fame Monster', 2009),
(6, 'Sheer Heart Attack', 1974),
(7, 'Off the Wall', 1979),
(8, 'Midnights', 2022),
(9, 'Love Sick', 2023),
(10, 'Mr. Morale and the Big Steppers', 2022);

/* Create songs table */
CREATE TABLE songs (
    id INT PRIMARY KEY AUTO_INCREMENT,
    album_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    duration INT NOT NULL,
    replay_count INT DEFAULT 0,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (album_id) REFERENCES albums(id),
    INDEX idx_album_id (album_id),
    CONSTRAINT unique_title_constraint UNIQUE (title)
);
/*Create values in songs table*/
INSERT INTO songs (album_id, title, duration) 
VALUES 
(1, 'Endlessly', 235),
(2, 'Beauty And A Beat', 347),
(3, 'Needed Me', 311),
(4, 'Titi Me Pregunto', 403),
(5, 'Bad Romance', 454),
(6, 'Killer Queen', 259),
(7, 'Rock With You', 340),
(8, 'Lavender Haze', 322),
(9, 'Honeymoon', 305),
(10, 'Rich Spirit', 315)
;

/* Update artist_id in albums table */
UPDATE albums
SET artist_id = (SELECT artists.id FROM artists JOIN artist_names ON artists.id = artist_names.artist_id WHERE artists.id = albums.artist_id);




