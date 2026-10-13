{{ config(materialized='incremental', schema='monitoring', alias='row_count_history') }}

select
    'dim_employees' as table_name,
    count(*) as row_count,
    now() as captured_at
from {{ ref('dim_employees') }}