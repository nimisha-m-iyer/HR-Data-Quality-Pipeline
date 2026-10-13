with recent_counts as (
    select
        row_count,
        captured_at,
        row_number() over (order by captured_at desc) as rn
    from "hr_db"."dbt_dev_monitoring"."row_count_history"
),

latest as (
    select row_count from recent_counts where rn = 1
),

previous as (
    select row_count from recent_counts where rn = 2
)

select
    latest.row_count as latest_count,
    previous.row_count as previous_count,
    round(
        abs(latest.row_count - previous.row_count)::numeric 
        / nullif(previous.row_count, 0) * 100, 
    2) as pct_change
from latest, previous
where abs(latest.row_count - previous.row_count)::numeric 
      / nullif(previous.row_count, 0) > 0.20  -- flag if >20% change