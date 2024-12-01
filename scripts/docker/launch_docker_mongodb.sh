#!/bin/bash

cd "$MM_DLK_PATH/MyDatalake/docker"

docker ps -q | xargs -r docker stop
docker ps -q | xargs -r docker rm
docker compose -f docker-compose-mongodb.yml down
docker volume ls -q | xargs -r volume rm

# docker with mongo db
docker-compose -f docker-compose-mongodb.yml up -d