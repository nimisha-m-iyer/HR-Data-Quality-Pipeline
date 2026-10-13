
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select new_salary
from "hr_db"."dbt_dev"."stg_salary_history"
where new_salary is null



  
  
      
    ) dbt_internal_test