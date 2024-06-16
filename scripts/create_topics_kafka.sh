#!/bin/bash

docker exec -it kafka kafka-topics.sh --create --bootstrap-server 127.0.0.1:9092 --topic actors_topic --create --partitions 3 --replication-factor 1
docker exec -it kafka kafka-topics.sh --list --bootstrap-server 127.0.0.1:9092

# docker exec -it kafka kafka-console-consumer.sh --bootstrap-server 127.0.0.1:9092 --topic actors_topic --from-beginning
# docker exec -it kafka kafka-console-producer.sh --bootstrap-server 127.0.0.1:9092 --topic actors_topic
