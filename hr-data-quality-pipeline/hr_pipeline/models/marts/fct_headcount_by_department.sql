select
    department_id,
    department_name,
    count(*) as total_employees,
    count(*) filter (where status = 'active') as active_employees,
    count(*) filter (where status = 'terminated') as terminated_employees,
    count(*) filter (where status = 'on_leave') as on_leave_employees,
    round(avg(salary), 2) as avg_salary
from {{ ref('dim_employees') }}
group by department_id, department_name