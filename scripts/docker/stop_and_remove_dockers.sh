#!/bin/bash

cd "$MM_DLK_PATH/MyDatalake/docker"
docker ps -q | xargs -r docker stop
docker ps -q | xargs -r docker rm
docker volume ls -q | xargs -r volume rm