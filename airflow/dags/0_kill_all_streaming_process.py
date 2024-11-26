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
    'execution_timeout': timedelta(seconds=30),
}

dag = DAG('0_kill_all_streaming_process', default_args=default_args, schedule_interval=None)

# Define the BashOperator
command = "ps aux | grep /MM_DLK/mydlk-ingestion | grep -v grep | awk '{print $2}' | xargs -r kill -9 "
exe = BashOperator(
    task_id='0_kill_all_streaming_process',
    bash_command=command,
    dag=dag,
)

exe