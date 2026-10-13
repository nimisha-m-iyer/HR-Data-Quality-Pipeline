with recent_nulls as (
    select
        null_percentage,
        captured_at,
        row_number() over (order by captured_at desc) as rn
    from {{ ref('capture_null_stats') }}
),

latest as (
    select null_percentage from recent_nulls where rn = 1
),

previous as (
    select null_percentage from recent_nulls where rn = 2
)

select
    latest.null_percentage as latest_pct,
    previous.null_percentage as previous_pct
from latest, previous
where latest.null_percentage > (previous.null_percentage + 10)  -- flag if null% jumped by more than 10 points