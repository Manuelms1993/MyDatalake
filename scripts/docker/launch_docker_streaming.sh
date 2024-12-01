#!/bin/bash

cd "$MM_DLK_PATH/MyDatalake/docker"

docker ps -q | xargs -r docker stop
docker ps -q | xargs -r docker rm
docker compose -f docker-compose-hadoop-hive-streaming.yml down
docker volume ls -q | xargs -r volume rm

# docker with hadoop-hive and flink and kafka
docker compose -f docker-compose-hadoop-hive-streaming.yml up -d

#sh /Users/manuelmontero/MM_DLK/MyDatalake/scripts/docker/launch_docker_kibana.sh
