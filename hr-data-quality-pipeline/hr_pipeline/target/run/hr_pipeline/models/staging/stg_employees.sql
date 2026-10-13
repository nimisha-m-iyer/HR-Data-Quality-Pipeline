
  create view "hr_db"."dbt_dev"."stg_employees__dbt_tmp"
    
    
  as (
    select
    id as employee_id,
    trim(name) as employee_name,
    department_id,
    salary,
    hire_date,
    manager_id,
    trim(lower(status)) as status
from "hr_db"."raw"."employees"
  );