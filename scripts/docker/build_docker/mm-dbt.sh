#!/bin/bash


IMAGE_NAME="manuelms1993/mm-dbt"

# Check if the image exists
if docker images | grep -q $IMAGE_NAME; then
    echo "Image $IMAGE_NAME exists. Removing it..."
    docker rmi $IMAGE_NAME:latest
else
    echo "Image $IMAGE_NAME does not exist. Proceeding to build..."
fi

cd /Users/manuelmontero/MM_DLK/MyDatalake/docker/Dockerfile/dbt/
docker build --no-cache -t $IMAGE_NAME:latest . --progress=plain