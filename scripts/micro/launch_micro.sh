#!/bin/bash

cd /home/manuel-montero/MM_DLK/mydlk-micro/ && nohup uvicorn micro:app --reload --port 8054 &> /dev/null &
