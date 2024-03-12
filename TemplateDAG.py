from datetime import datetime, timedelta
from airflow import DAG
from airflow.operators.dummy_operator import DummyOperator
from airflow.operators.python_operator import PythonOperator

def minha_funcao_python():
    # Aqui você pode adicionar qualquer código Python que deseja executar como parte desta tarefa
    print("Hello World from Airflow!")

# Definição dos argumentos padrão que serão passados para cada operador
default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'start_date': datetime(2024, 3, 12),
    'email_on_failure': False,
    'email_on_retry': False,
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
}

# Definindo a DAG
with DAG(
    'minha_primeira_dag',
    default_args=default_args,
    description='Uma DAG de exemplo para começar',
    schedule_interval=timedelta(days=1),
) as dag:

    # Definindo as tarefas
    tarefa_inicio = DummyOperator(
        task_id='inicio'
    )

    tarefa_executar_python = PythonOperator(
        task_id='executar_funcao_python',
        python_callable=minha_funcao_python,
    )

    tarefa_fim = DummyOperator(
        task_id='fim'
    )

    # Definindo as dependências: inicio -> executar_python -> fim
    tarefa_inicio >> tarefa_executar_python >> tarefa_fim
