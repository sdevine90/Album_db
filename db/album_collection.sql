DROP TABLE IF EXISTS songs;
DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS collectors;



CREATE TABLE collectors (
id SERIAL8 primary key,
name VARCHAR(255) NOT NULL
);

CREATE TABLE albums  (
id SERIAL8 primary key,
artist VARCHAR(255) NOT NULL,
title VARCHAR(255) NOT NULL,
genre VARCHAR(255) NOT NULL,
collector_id INT8 references collectors(id)
);

CREATE TABLE songs(
id SERIAL8 primary key,
song_title VARCHAR(255) NOT NULL,
album_id INT8 references albums(id)
);
