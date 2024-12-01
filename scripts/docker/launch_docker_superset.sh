#!/bin/bash

docker run -d -p 18088:8088 -v /home/manuel-montero/MM_DLK/mydlk-dashboard/superset/superset_home:/app/superset_home \
  -e "SUPERSET_SECRET_KEY=your_secret_key_here" --name superset apache/superset
docker exec -it superset superset fab create-admin \
              --username admin \
              --firstname Superset \
              --lastname Admin \
              --email admin@superset.com \
              --password admin

docker exec -it superset superset db upgrade
#docker exec -it superset superset load_examples
docker exec -it superset superset init