CREATE DATABASE IF NOT EXISTS raw;
CREATE DATABASE IF NOT EXISTS stream;
CREATE DATABASE IF NOT EXISTS bi;

CREATE TABLE person_table (
    person_id STRING,
    name STRING,
    character STRING,
    role STRING
)
STORED AS PARQUET;

CREATE TABLE media_table (
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

CREATE TABLE media_ratings (
    id INT,
    title STRING,
    imdb_score FLOAT,
    imdb_votes INT,
    tmdb_popularity FLOAT,
    tmdb_score FLOAT
)
STORED AS PARQUET;