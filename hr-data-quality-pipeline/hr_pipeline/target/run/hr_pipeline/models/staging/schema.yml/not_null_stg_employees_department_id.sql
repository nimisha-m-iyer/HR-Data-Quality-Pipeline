
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select department_id
from "hr_db"."dbt_dev"."stg_employees"
where department_id is null



  
  
      
    ) dbt_internal_test