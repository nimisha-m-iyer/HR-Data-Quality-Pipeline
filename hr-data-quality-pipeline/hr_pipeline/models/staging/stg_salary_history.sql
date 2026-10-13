select
    employee_id,
    old_salary,
    new_salary,
    change_date
from {{ source('raw', 'salary_history') }}