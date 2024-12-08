# My Data Lake

Welcome to my personal data lake to practice and integrate cutting-edge technologies in data management. Created as a hands-on learning project, it serves as a comprehensive platform for exploring, implementing, and refining data storage, processing and analysis techniques. 


## Authors

- [@ManuelMontero](https://www.linkedin.com/in/manuel-montero/)

## On-premise architecture

![Architecture Diagram](img/arquitecture-on-premise_v1.png)

### Repositories

1. MyDataLake: https://github.com/Manuelms1993/MyDatalake
2. MyDockers: https://hub.docker.com/u/manuelms1993   
3. Data ingestion: https://github.com/Manuelms1993/mydlk-ingestion
4. Compute 
    * dbt: https://github.com/Manuelms1993/mydlk-dbt
5. Dashboards: https://github.com/Manuelms1993/mydlk-dashboard
6. APIs: https://github.com/Manuelms1993/mydlk-micro 

### Database Structure
This section describes the database structure implemented in the data lake, which consists of various main databases adapted to the different stages of data processing and analysis.
- Raw Database: Initial landing area for raw, unprocessed data from various sources.
- Stream Database: Real-time data processing and analysis for streaming data.
- BI Database: Optimized for business intelligence and analytics.

### Compute (raw data to BI database)
The compute process involves a few stages of data transformation and processing to ensure that raw data is refined, aggregated, and prepared for business intelligence and analytics purposes.

### Orchestration

##### Airflow
![DAGS](img/airflow.png)

### API REST examples
OpenAPI Specification (OAS 3.0) : https://github.com/Manuelms1993/mydlk-micro/blob/master/oas3.yml

| **HTTP Method** | **Endpoint**                      | **Description**                                                                | **Request Parameters**                                 | **Request Type** |
|-----------------|-----------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------|------------------|
| **GET**         | `/get-imdb-film/`                 | Retrieve a film's details by its unique `id`                                   | `id` (integer, required)                              | GET              |
| **GET**         | `/get-imdb-film-by-name/`         | Retrieve a film's details by its name                                          | `name` (string, required)                              | GET              |
| **POST**        | `/create-film/`                   | Create a new film entry in the database                                         | JSON object with film details                          | POST             |
| **PUT**         | `/insert-if-not-exist-film/`      | Insert a new film entry if it doesn't already exist (based on `id`)            | JSON object with film details                          | PUT              |
| **PATCH**       | `/update-film/{film_id}`          | Partially update a film entry by `film_id`                                      | `film_id` (string, required) and JSON object with fields to update | PATCH            |
| **DELETE**      | `/delete-film/{film_id}`          | Delete a film entry by `film_id`                                               | `film_id` (string, required)                            | DELETE           |

### Dashboards
This section presents various dashboards and data analysis projects created with different visualisation and analysis tools. These dashboards provide information on various pre-processed datasets.

##### Superset
![Architecture Diagram](img/superset-dashboard.png)