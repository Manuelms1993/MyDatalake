#!/bin/bash

cd /Users/manuelmontero/MM_DLK/MyDatalake/docker
docker ps -q | xargs -r docker stop
docker ps -q | xargs -r docker rm
docker volume ls -q | xargs -r volume rm