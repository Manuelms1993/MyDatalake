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

dag = DAG('1_batch_hive_ingestion', default_args=default_args, schedule_interval=None)

# Define the command to execute using docker exec
command = "python /Users/manuelmontero/MM_DLK/mydlk-ingestion/main_batch.py "

# Define the BashOperator
hive_task = BashOperator(
    task_id='1_batch_hive_ingestion',
    bash_command=command,
    dag=dag,
)

# Define the task dependencies
hive_task