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

dag = DAG('Z_kill_all_dockers_and_clean.py', default_args=default_args, schedule_interval=None)

# Define the command to execute using docker exec
command = "sh /home/manuel-montero/MM_DLK/MyDatalake/scripts/docker/stop_and_remove_dockers.sh &> /dev/null & "

# Define the BashOperator
task = BashOperator(
    task_id='Z_kill_all_dockers_and_clean.py',
    bash_command=command,
    dag=dag,
)

# Define the task dependencies
task