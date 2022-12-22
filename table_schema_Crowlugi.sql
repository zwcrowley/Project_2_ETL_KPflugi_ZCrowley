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
    country_ID INTEGER NOT NULL,
    city VARCHAR(255),
    PRIMARY KEY (country_ID, city)
);
-- Import data from new_country_junction_df using sqlalchemy.

-- Create city_junction table:
CREATE TABLE city_junction (
    city_ID INTEGER NOT NULL,
    city VARCHAR(255),
    PRIMARY KEY (city_ID, city)
);
-- Import data from new_city_junction_df using sqlalchemy.

-- Create cities table:
CREATE TABLE cities (
    city_ID INTEGER NOT NULL,
    city_country_ID INTEGER NOT NULL,
    lat FLOAT NOT NULL,
    lng FLOAT NOT NULL,
    population FLOAT NOT NULL,
    PRIMARY KEY (city_ID)
);  
-- Import data from new_cities_df using sqlalchemy.

-- Create happiness table:
CREATE TABLE happiness (
    country_ID INTEGER NOT NULL,
    overall_rank INTEGER NOT NULL,
    country VARCHAR(255),
    score FLOAT NOT NULL,
    generosity  FLOAT NOT NULL,
    perceptions_of_corruption  FLOAT NOT NULL,
    PRIMARY KEY (country_ID)
);
-- Import data from new_happiness_df using sqlalchemy.


-- Create airport table:
CREATE TABLE airport (
    city_ID INTEGER NOT NULL,
    airport_name VARCHAR(255),
    airport_address VARCHAR(255),
    airport_rating FLOAT NOT NULL,
    PRIMARY KEY (city_ID)
);
-- Import data from new_airport_df using sqlalchemy.

-- Create beaches table:
CREATE TABLE beaches (
    city_ID INTEGER NOT NULL,
    beach_name VARCHAR(255),
    beach_address VARCHAR(255),
    beach_rating FLOAT NOT NULL,
    PRIMARY KEY (city_ID)
);
-- Import data from new_beaches_df using sqlalchemy.

-- Create weather table:
CREATE TABLE weather (
    city_ID INTEGER NOT NULL,
    min_temp FLOAT NOT NULL,
    max_temp  FLOAT NOT NULL,
    humidity INTEGER NOT NULL,
    cloudiness INTEGER NOT NULL,
    PRIMARY KEY (city_ID)
);
-- Import data from new_weather_df using sqlalchemy.

-----------
**************** NEED TO FINISH ADDING FOREIGN KEYS
-- Add foreign keys to all of the tables now that all the tables are added:
--country_junction - 2 Foreign Keys
ALTER TABLE country_junction ADD CONSTRAINT fk_country_junction_happiness FOREIGN KEY (country_ID)
REFERENCES happiness (country_ID);

ALTER TABLE country_junction ADD CONSTRAINT fk_country_junction_city_junction FOREIGN KEY (city)
REFERENCES happiness (city);

--country_junction
ALTER TABLE city_junction ADD CONSTRAINT fk_city_junction_country_junction FOREIGN KEY (city)
REFERENCES country_junction (city);

ALTER TABLE city_junction ADD CONSTRAINT fk_country_junction_cities FOREIGN KEY (city_ID)
REFERENCES cities (city_ID);

-- cities
ALTER TABLE cities ADD CONSTRAINT fk_cities_happiness FOREIGN KEY (city_country_ID)
REFERENCES happiness  (city_country_ID);

ALTER TABLE cities ADD CONSTRAINT fk_cities_airport FOREIGN KEY (city_ID)
REFERENCES airport   (city_ID);

ALTER TABLE cities ADD CONSTRAINT fk_cities_beaches FOREIGN KEY (city_ID)
REFERENCES beaches (city_ID);

ALTER TABLE cities ADD CONSTRAINT fk_cities_weather
FOREIGN KEY (city_ID)
REFERENCES weather (city_ID);

-- happiness 
ALTER TABLE happiness  ADD CONSTRAINT fk_happiness_cities FOREIGN KEY (country_ID)
REFERENCES cities (city_country_ID);

ALTER TABLE happiness  ADD CONSTRAINT fk_happiness_country_junction FOREIGN KEY (country_ID)
REFERENCES country_junction (country_ID);


-----------

--Check all tables:
SELECT * FROM country_junction;

SELECT * FROM city_junction;

SELECT * FROM happiness;

SELECT * FROM cities;

SELECT * FROM airport;

SELECT * FROM beaches;

SELECT * FROM weather;

