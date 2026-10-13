
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select department_name
from "hr_db"."dbt_dev"."stg_departments"
where department_name is null



  
  
      
    ) dbt_internal_test