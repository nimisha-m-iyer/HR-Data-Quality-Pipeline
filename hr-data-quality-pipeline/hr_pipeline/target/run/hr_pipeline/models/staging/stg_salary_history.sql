
  create view "hr_db"."dbt_dev"."stg_salary_history__dbt_tmp"
    
    
  as (
    select
    employee_id,
    old_salary,
    new_salary,
    change_date
from "hr_db"."raw"."salary_history"
  );