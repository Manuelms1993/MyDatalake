CREATE DATABASE IF NOT EXISTS raw;
CREATE DATABASE IF NOT EXISTS stream;
CREATE DATABASE IF NOT EXISTS bi;

CREATE TABLE raw.actors (
    person_id STRING,
    name STRING,
    character STRING,
    role STRING
)
STORED AS PARQUET;

CREATE TABLE raw.films (
    id STRING,
    title STRING,
    type STRING,
    release_year INT,
    age_certification STRING,
    runtime INT,
    genres ARRAY<STRING>,
    production_countries ARRAY<STRING>,
    seasons INT
)
STORED AS PARQUET;

CREATE TABLE raw.imdb (
    id INT,
    title STRING,
    imdb_score FLOAT,
    imdb_votes INT,
    tmdb_popularity FLOAT,
    tmdb_score FLOAT
)
STORED AS PARQUET;