#!/bin/bash


export MM_DLK_PATH="/home/manuel-montero/MM_DLK"

# airflow
export AIRFLOW_HOME="/home/manuel-montero/MM_DLK/MyDatalake/airflow"
export AIRFLOW__CORE__LOAD_EXAMPLES=False


# alias
alias alias_python_env="source /home/manuel-montero/MM_DLK/venv/bin/activate"
alias alias_airflow_standalone="airflow standalone"