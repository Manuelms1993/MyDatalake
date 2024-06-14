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

dag = DAG('create_hive_schema_and_tables', default_args=default_args, schedule_interval=None)

# Define the command to execute using docker exec
command = "sh /Users/manuelmontero/MM_DLK/MyDatalake/scripts/create_databases_and_tables.sh "

# Define the BashOperator
hive_task = BashOperator(
    task_id='create_databases_and_tables',
    bash_command=command,
    dag=dag,
)

# Define the task dependencies
hive_task