#!/bin/bash

TOPIC_NAME="actors_topic"

# Check if the topic exists
docker exec -it kafka kafka-topics.sh --list --bootstrap-server 127.0.0.1:9092 | grep -w $TOPIC_NAME > /dev/null

# If the topic does not exist, create it
if [ $? -ne 0 ]; then
    echo "Creating topic $TOPIC_NAME"
    docker exec -it kafka kafka-topics.sh --create --bootstrap-server 127.0.0.1:9092 --topic $TOPIC_NAME --create --partitions 3 --replication-factor 1
else
    echo "Topic $TOPIC_NAME already exists"
fi

# docker exec -it kafka kafka-console-consumer.sh --bootstrap-server 127.0.0.1:9092 --topic actors_topic --from-beginning
# docker exec -it kafka kafka-console-producer.sh --bootstrap-server 127.0.0.1:9092 --topic actors_topic