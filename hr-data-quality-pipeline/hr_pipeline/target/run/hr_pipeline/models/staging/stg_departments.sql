
  create view "hr_db"."dbt_dev"."stg_departments__dbt_tmp"
    
    
  as (
    select
    id as department_id,
    trim(lower(name)) as department_name,
    trim(lower(location)) as location
from "hr_db"."raw"."departments"
  );