
  create view "hr_db"."dbt_dev"."fct_headcount_by_department__dbt_tmp"
    
    
  as (
    select
    department_id,
    department_name,
    count(*) as total_employees,
    count(*) filter (where status = 'active') as active_employees,
    count(*) filter (where status = 'terminated') as terminated_employees,
    count(*) filter (where status = 'on_leave') as on_leave_employees,
    round(avg(salary), 2) as avg_salary
from "hr_db"."dbt_dev"."dim_employees"
group by department_id, department_name
  );