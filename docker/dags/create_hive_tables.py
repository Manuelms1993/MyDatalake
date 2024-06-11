from datetime import datetime
from airflow import DAG
from airflow.operators.bash import BashOperator

default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'start_date': datetime.utcnow(),  # Set start_date to current UTC time
    'email_on_failure': False,
    'email_on_retry': False,
    'retries': 1,
}

dag = DAG('create_hive_schema_and_tables', default_args=default_args, schedule_interval=None)

# Define the command to execute using docker exec
command = "docker exec hive-server hive -f /MM_DLK/MyDatalake/hqls/createDB.sql"

# Define the BashOperator
hive_task = BashOperator(
    task_id='hive_task_with_bash_operator',
    bash_command=command,
    dag=dag,
)

# Define the task dependencies
hive_task