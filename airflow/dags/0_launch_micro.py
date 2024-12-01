from datetime import datetime, timedelta
from airflow import DAG
from airflow.operators.bash import BashOperator

default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'start_date': datetime.utcnow(),  # Set start_date to current UTC time
    'email_on_failure': False,
    'email_on_retry': False,
    'retry_delay': timedelta(seconds=5),
    'retries': 1,
}

dag = DAG('0_launch_micro', default_args=default_args, schedule_interval=None)

# Define the command to execute using docker exec
command = "uvicorn /home/manuel-montero/MM_DLK/mydlk-micro/micro:app --reload --port 8054 "

# Define the BashOperator
task = BashOperator(
    task_id='0_launch_micro',
    bash_command=command,
    dag=dag,
)

# Define the task dependencies
task