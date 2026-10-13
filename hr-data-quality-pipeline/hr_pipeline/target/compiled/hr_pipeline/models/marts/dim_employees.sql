select
    e.employee_id,
    e.employee_name,
    e.salary,
    e.hire_date,
    e.status,
    e.manager_id,
    d.department_id,
    d.department_name,
    d.location as department_location
from "hr_db"."dbt_dev"."stg_employees" e
left join "hr_db"."dbt_dev"."stg_departments" d
    on e.department_id = d.department_id