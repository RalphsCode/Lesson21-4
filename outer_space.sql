-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

-- Created a new table --
CREATE TABLE galaxies
(
  id SERIAL PRIMARY KEY,
  gxy_name TEXT NOT NULL
);

INSERT INTO galaxies (gxy_name)
VALUES 
('Milky Way'), 
('Andromeda'), 
('Triangulum');

-- Created a new table --
CREATE TABLE stars
(
  id SERIAL PRIMARY KEY,
  star_name VARCHAR(25),
  galaxy_id INT REFERENCEs galaxies(id)
);

INSERT INTO stars (star_name)
VALUES
('The Sun'),
('Proxima Centauri'),
('Gliese 876');

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around INT REFERENCES stars(id) NOT NULL,
  galaxy_id INT REFERENCES galaxies(id) NOT NULL,
  moons TEXT[]
);

INSERT INTO planets
  (name, orbital_period_in_years, orbits_around, galaxy_id, moons)
VALUES
  ('Earth', 1.00, 1, 1, '{"The Moon"}'),
  ('Mars', 1.88, 1, 1, '{"Phobos", "Deimos"}'),
  ('Venus', 0.62, 1, 1, '{}'),
  ('Neptune', 164.8, 1, 1, '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
  ('Proxima Centauri b', 0.03, 2, 1, '{}'),
  ('Gliese 876 b', 0.23, 3, 1, '{}');