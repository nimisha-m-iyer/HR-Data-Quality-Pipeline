

select
    'dim_employees' as table_name,
    count(*) as row_count,
    now() as captured_at
from "hr_db"."dbt_dev"."dim_employees"