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
-- Create country table:
CREATE TABLE country (
    city_ID INTEGER NOT NULL,
    city VARCHAR(255),
    country_ID INTEGER NOT NULL,
    PRIMARY KEY (city_ID, country_ID)
);
-- Import data from new_country_df using sqlalchemy.

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

-- Create cities table:
CREATE TABLE cities (
    city_ID INTEGER NOT NULL,
    city VARCHAR(255),
    lat FLOAT NOT NULL,
    lng FLOAT NOT NULL,
    population  FLOAT NOT NULL,
    PRIMARY KEY (city_ID)
);

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
ALTER TABLE country ADD CONSTRAINT fk_country_happiness FOREIGN KEY (country_ID)
REFERENCES happiness (country_ID);
****************
-----------

--Check all tables:
SELECT * FROM country;

SELECT * FROM happiness;

SELECT * FROM cities;

SELECT * FROM airport;

SELECT * FROM beaches;

SELECT * FROM weather;

