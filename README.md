# Music-Database-
A mockup version of a Spotify music and account database created from scratch using MySQL Workbench.

The Music Database Management System is a MySQL-based project that aims to store and manage information related to music artists, albums, songs, and users. The database facilitates the storage of user details, favorite artists, and their corresponding albums and songs.

Key Components:
Users Table:
This table stores user information, including a unique ID, username, password, email, and the timestamp of user creation.

Favorite Artists Table:
The favorite_artists table is used to associate users with their preferred artists. It contains the user_id, artist_id, and artist_name columns, along with an additional user_name column that is updated through a JOIN operation with the users table.

Artists Table:
The artists table holds information about various artists. Each artist has a unique ID and a reference to their corresponding name in the artist_names table.

Artist Names Table:
This table contains the names of artists, along with their unique ID, which is referenced in the artists and favorite_artists tables. The name column has a unique constraint to ensure no duplicate artist names are stored.

Albums Table:
The albums table stores information about different albums. Each album has a unique ID, an associated artist_id, a title, and the release year. The title column has a unique constraint to prevent duplicate album entries.

Songs Table:
The songs table stores data about individual songs. It includes a unique ID, the album_id to which the song belongs, the title of the song, its duration, the number of times it has been replayed (replay_count), and the timestamp of its creation. The title column has a unique constraint to ensure there are no duplicate song titles within an album.

The Music Database Management System enables users to:
- Register and store their username, password, and email.
- Add their favorite artists to the favorite_artists table, along with corresponding artist IDs and names.
- Retrieve and update user information, such as favorite artists and their profile image.
- Store details about various artists, albums, and songs, along with their associations and constraints to ensure data integrity.
- The database can serve as a foundation for music-related applications, providing functionalities like user preferences, recommendations, and playlist generation based on favorite artists and songs. Additionally, it can facilitate data analysis and reporting on user preferences and trending artists and albums.
