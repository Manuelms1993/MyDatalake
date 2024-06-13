#!/bin/bash

docker exec -it kafka kafka-topics.sh --create --bootstrap-server 127.0.0.1:9092 --topic firsttopic --create --partitions 3 --replication-factor 1
docker exec -it kafka kafka-topics.sh --list --bootstrap-server 127.0.0.1:9092
