-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE "passenger"(
    "id" SERIAL PRIMARY KEY,
    "first_name" VARCHAR(30) NOT NULL,
    "last_name" VARCHAR(30) NOT NULL,
    "cell_number" VARCHAR(10),
    "freq_flyer_num" VARCHAR(8)
);

CREATE TABLE "airlines"(
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(40) NOT NULL
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  passenger_id INT REFERENCES passenger(id),
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline_id INT NOT NULL REFERENCES airlines(id), 
  from_city TEXT NOT NULL,
  from_country TEXT NOT NULL,
  to_city TEXT NOT NULL,
  to_country TEXT NOT NULL
);

INSERT INTO passenger
(first_name, last_name)
VALUES('Jennifer', 'Finch'),
('Thadeus', 'Gathercoal'),
('Sonja', 'Pauley'),
('Waneta', 'Skeleton'),
('Berkie', 'Wycliff'),
('Alvin', 'Leathes'),
('Cory', 'Squibbes');

INSERT INTO airlines
(name)
VALUES('United'),
('British Airways'),
('Delta'),
('TUI Fly Belgium'),
('Air China'),
('American Airlines'),
('Avianca Brasil');

INSERT INTO tickets
  (passenger_id, seat, departure, arrival, airline_id, from_city, from_country, to_city, to_country)
VALUES
  (1, '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 'Washington DC', 'United States', 'Seattle', 'United States'),
  (2, '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 'Tokyo', 'Japan', 'London', 'United Kingdom'),
  (3, '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 'Los Angeles', 'United States', 'Las Vegas', 'United States'),
  (1, '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 3, 'Seattle', 'United States', 'Mexico City', 'Mexico'),
  (4, '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 4, 'Paris', 'France', 'Casablanca', 'Morocco'),
  (2, '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 5, 'Dubai', 'UAE', 'Beijing', 'China'),
  (5, '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 1, 'New York', 'United States', 'Charlotte', 'United States'),
  (6, '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 6, 'Cedar Rapids', 'United States', 'Chicago', 'United States'),
  (5, '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 6, 'Charlotte', 'United States', 'New Orleans', 'United States'),
  (7, '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 7, 'Sao Paolo', 'Brazil', 'Santiago', 'Chile');