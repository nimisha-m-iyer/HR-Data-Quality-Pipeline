
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select total_employees
from "hr_db"."dbt_dev"."fct_headcount_by_department"
where total_employees is null



  
  
      
    ) dbt_internal_test