#!/bin/bash

cd /Users/manuelmontero/MM_DLK/MyDatalake/docker
docker stop $(docker ps -q)
docker rm $(docker ps -qa)
docker-compose up -d