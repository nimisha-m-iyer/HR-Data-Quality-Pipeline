select
    id as department_id,
    trim(lower(name)) as department_name,
    trim(lower(location)) as location
from {{ source('raw', 'departments') }}