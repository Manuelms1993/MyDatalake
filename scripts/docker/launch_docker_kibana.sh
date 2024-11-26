#!/bin/bash

docker stop elasticsearch
docker stop kibana
docker rm elasticsearch
docker rm kibana

# Define the network name
NETWORK_NAME="bridge"

# Check if the network exists
if ! docker network ls | grep -q "$NETWORK_NAME"; then
  # Create the network if it does not exist
  docker network create "$NETWORK_NAME"
  echo "Network '$NETWORK_NAME' created."
else
  echo "Network '$NETWORK_NAME' already exists."
fi

docker run -d -p 9200:9200 --name elasticsearch --platform linux/x86_64 --net=$NETWORK_NAME bitnami/elasticsearch
docker run -d -p 5601:5601 --name kibana --platform linux/x86_64 --net=$NETWORK_NAME \
  -e KIBANA_ELASTICSEARCH_URL="http://host.docker.internal:9200" \
  manuelms1993/mm-kibana