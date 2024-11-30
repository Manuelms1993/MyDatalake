#!/bin/bash

cd /Users/manuelmontero/MM_DLK/MyDatalake/docker
docker ps -q | xargs -r docker stop
docker ps -q | xargs -r docker rm
docker compose -f docker-compose-hadoop-hive.yml down
docker volume ls -q | xargs -r volume rm

# docker with hadoop-hive
docker compose -f docker-compose-hadoop-hive.yml --profile atlasdb up -d