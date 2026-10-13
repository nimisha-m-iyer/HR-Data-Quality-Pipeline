
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select salary
from "hr_db"."dbt_dev"."stg_employees"
where salary is null



  
  
      
    ) dbt_internal_test