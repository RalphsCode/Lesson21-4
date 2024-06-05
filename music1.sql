-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  album TEXT NOT NULL
);

CREATE TABLE artists
(id SERIAL PRIMARY KEY,
art_name TEXT NOT NULL
);

INSERT INTO artists
(art_name)
VALUES
('Destiny''s Child'),
('Maroon 5'),
('Christina Aguilera'),
('Hanson'),
('Avril Lavigne'),
('Katy Perry'),
('Juicy J'),
('Mariah Cary'),
('Boyz II Men'),
('Lady Gaga'),
('Bradley Cooper'),
('Nickelback}'),
('Queen'),
('Jay Z'),
('Alicia Keys');

CREATE TABLE producers
(id SERIAL PRIMARY KEY,
prod_name TEXT NOT NULL
);

INSERT INTO producers
(prod_name)
VALUES
('Walter Afanasieff'),
('Al Shux'),
('Max Martin'),
('Cirkut'),
('Shellback'),
('Benny Blanco'),
('The Matrix'),
('Rick Parashar'),
('Dust Brothers'),
('Stephen Lironi'),
('Darkchild'),
('Roy Thomas Baker'),
('Benjamin Rice');

CREATE TABLE song_artist
(id SERIAL PRIMARY KEY,
song_id INT, --REFERENCES songs(id),
artist_id INT --REFERENCES artists(id)
);

INSERT INTO song_artist
(song_id, artist_id)
VALUES
(1,4),
(2,13),
(3,8),
(3,9),
(4,10),
(4,11),
(5,12),
(6,14),
(6,15),
(7,6),
(7,7),
(8,2),
(8,3),
(9,5),
(10,1);

CREATE TABLE song_producer
(id SERIAL PRIMARY KEY,
song_id INT, -- REFERENCES songs(id),
prod_id INT -- REFERENCES producers(id)
);

INSERT INTO song_producer
(song_id, prod_id)
VALUES
(1,9),
(1,10),
(2,12),
(3,1),
(4,13),
(5,8),
(6,2),
(7,3),
(7,4),
(8,5),
(8,6),
(9,7),
(10,11);

INSERT INTO songs
  (title, duration_in_seconds, release_date, album)
VALUES
  ('MMMBop', 238, '04-15-1997', 'Middle of Nowhere'),
  ('Bohemian Rhapsody', 355, '10-31-1975', 'A Night at the Opera'),
  ('One Sweet Day', 282, '11-14-1995', 'Daydream'),
  ('Shallow', 216, '09-27-2018', 'A Star Is Born'),
  ('How You Remind Me', 223, '08-21-2001', 'Silver Side Up'),
  ('New York State of Mind', 276, '10-20-2009', 'The Blueprint 3'),
  ('Dark Horse', 215, '12-17-2013', 'Prism'),
  ('Moves Like Jagger', 201, '06-21-2011', 'Hands All Over'),
  ('Complicated', 244, '05-14-2002', 'Let Go'),
  ('Say My Name', 240, '11-07-1999', 'The Writing''s on the Wall');

-- Query to display artist and song title --
SELECT art_name AS artist, title AS song_title FROM songs
JOIN song_artist on songs.id = song_artist.song_id
JOIN artists ON artists.id = song_artist.artist_id;
