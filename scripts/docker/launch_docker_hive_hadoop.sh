#!/bin/bash

cd /Users/manuelmontero/MM_DLK/MyDatalake/docker
docker stop $(docker ps -q)
docker rm $(docker ps -qa)
docker-compose down -v
docker volume rm $(docker volume ls -q)

# docker with hadoop-hive
docker-compose -f docker-compose-hadoop-hive.yml up -d