-- Project 2 ETL: Crowlugi Resort
-- By: Kathleen Pflugi and Zack Crowley
-- Table Schema for loading data into db in postgreSQL

-- Creating the database named "resorts_db":
CREATE DATABASE resorts_db
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False; 

-- Make Tables to import data from csv files using sqlalchemy:
-- Create country_junction table:
CREATE TABLE country_junction (
    country_id INTEGER NOT NULL,
    city VARCHAR(255),
    PRIMARY KEY (country_id, city)
);
-- Import data from new_country_junction_df using sqlalchemy.

-- Create city_junction table:
CREATE TABLE city_junction (
    city_id INTEGER NOT NULL,
    city VARCHAR(255),
    PRIMARY KEY (city_id, city)
);
-- Import data from new_city_junction_df using sqlalchemy.

-- Create cities table:
CREATE TABLE cities (
    city_id INTEGER NOT NULL,
    city_country_id INTEGER NOT NULL,
    lat FLOAT NOT NULL,
    lng FLOAT NOT NULL,
    population FLOAT NOT NULL,
    PRIMARY KEY (city_id)
);  
-- Import data from new_cities_df using sqlalchemy.

-- Create happiness table:
CREATE TABLE happiness (
    country_id INTEGER NOT NULL,
    overall_rank INTEGER NOT NULL,
    country VARCHAR(255),
    score FLOAT NOT NULL,
    generosity  FLOAT NOT NULL,
    perceptions_of_corruption  FLOAT NOT NULL,
    PRIMARY KEY (country_id)
);
-- Import data from new_happiness_df using sqlalchemy.

-- Create airport table:
CREATE TABLE airport (
    city_id INTEGER NOT NULL,
    airport_name VARCHAR(255),
    airport_address VARCHAR(255),
    airport_rating FLOAT NOT NULL,
    PRIMARY KEY (city_id)
);
-- Import data from new_airport_df using sqlalchemy.

-- Create beaches table:
CREATE TABLE beaches (
    city_id INTEGER NOT NULL,
    beach_name VARCHAR(255),
    beach_address VARCHAR(255),
    beach_rating FLOAT NOT NULL,
    PRIMARY KEY (city_id)
);
-- Import data from new_beaches_df using sqlalchemy.

-- Create weather table:
CREATE TABLE weather (
    city_id INTEGER NOT NULL,
    min_temp FLOAT NOT NULL,
    max_temp  FLOAT NOT NULL,
    humidity INTEGER NOT NULL,
    cloudiness INTEGER NOT NULL,
    PRIMARY KEY (city_id)
);
-- Import data from new_weather_df using sqlalchemy.

-----------
-- Add foreign keys to all of the tables now that all the tables are added:
--country_junction - 2 Foreign Keys
ALTER TABLE country_junction ADD CONSTRAINT fk_country_junction_happiness FOREIGN KEY (country_id)
REFERENCES happiness (country_id);

ALTER TABLE country_junction ADD CONSTRAINT fk_country_junction_city_junction FOREIGN KEY (city)
REFERENCES city_junction (city);

--country_junction
ALTER TABLE city_junction ADD CONSTRAINT fk_country_junction_cities FOREIGN KEY (city_id)
REFERENCES cities (city_id);

-- cities
ALTER TABLE cities ADD CONSTRAINT fk_cities_happiness FOREIGN KEY (city_country_ID)
REFERENCES happiness  (country_ID);

ALTER TABLE cities ADD CONSTRAINT fk_cities_airport FOREIGN KEY (city_id)
REFERENCES airport   (city_id);

ALTER TABLE cities ADD CONSTRAINT fk_cities_beaches FOREIGN KEY (city_id)
REFERENCES beaches (city_id);

ALTER TABLE cities ADD CONSTRAINT fk_cities_weather
FOREIGN KEY (city_id)
REFERENCES weather (city_id);

-----------

--Check all tables:
SELECT * FROM country_junction;

SELECT * FROM city_junction;

SELECT * FROM happiness;

SELECT * FROM cities;

SELECT * FROM airport;

SELECT * FROM beaches;

SELECT * FROM weather;

-- Create a view to join all of the tables with city and country level data:
SELECT c.city_id, c.lat, c.lng, c.population, a.airport_name, 
a.airport_address, a.airport_rating, cj.city, w.min_temp, w.max_temp, w.humidity, w.cloudiness,
h.overall_rank, h.country, h.score, h.generosity, h.perceptions_of_corruption,
b.beach_name, b.beach_address, b.beach_rating
FROM cities as c
JOIN airport as a
ON a.city_id = c.city_id
JOIN city_junction as cj
ON c.city_id = cj.city_id
JOIN weather as w
ON c.city_id = w.city_id
JOIN happiness as h
ON c.city_country_id = h.country_id
JOIN beaches as b
ON c.city_id = b.city_id



