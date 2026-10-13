select
    id as employee_id,
    trim(name) as employee_name,
    department_id,
    salary,
    hire_date,
    manager_id,
    trim(lower(status)) as status
from "hr_db"."raw"."employees"