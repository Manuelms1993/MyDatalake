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

dag = DAG('1_stream_hive_ingestion', default_args=default_args, schedule_interval=None)

# Define the BashOperator
command = "sh /Users/manuelmontero/MM_DLK/MyDatalake/scripts/create_topics_kafka.sh "
create_topic = BashOperator(
    task_id='create_topic',
    bash_command=command,
    dag=dag,
)

# Define the BashOperator
command2 = "python /Users/manuelmontero/MM_DLK/mydlk-ingestion/kafka_producer_actors.py &> /dev/null & "
producer = BashOperator(
    task_id='execute_producer',
    bash_command=command2,
    dag=dag,
)


# Define the BashOperator
command3 = "python /Users/manuelmontero/MM_DLK/mydlk-ingestion/main_stream.py & "
consumer = BashOperator(
    task_id='execute_consumer_to_hive',
    bash_command=command3,
    dag=dag,
)

# Define the task dependencies
create_topic >> producer >> consumer