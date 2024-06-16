#!/bin/bash

cd /Users/manuelmontero/MM_DLK/MyDatalake/docker
docker stop $(docker ps -q)
docker rm $(docker ps -qa)
docker-compose down -v
docker volume rm $(docker volume ls -q)

# docker with hadoop-hive
docker-compose -f docker-compose-hadoop-hive.yml up -d

# docker with hadoop-hive and flink and kafka
#docker-compose -f docker-compose-hadoop-hive-streaming.yml up -d


# aditional comands
#sleep 10
#docker exec -it namenode hadoop fs -mkdir -p /user/hive/warehouse
#docker exec -it namenode hadoop fs -chmod -R 777 /user/hive