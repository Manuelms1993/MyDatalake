#!/bin/bash

cd "$MM_DLK_PATH/MyDatalake/docker"

docker ps -q | xargs -r docker stop
docker ps -q | xargs -r docker rm
docker compose -f docker-compose-hadoop-hive.yml down
docker compose -f docker-compose-hue.yml down
docker volume ls -q | xargs -r volume rm

# docker with hadoop-hive
docker compose -f docker-compose-hadoop-hive.yml --profile atlasdb up -d
docker compose -f docker-compose-hue.yml up -d
