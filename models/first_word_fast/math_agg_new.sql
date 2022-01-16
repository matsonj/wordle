{{ config(
    tags=["new"],
    materialized = "table"
) }}

select
guess,
sum(total),
avg(total) avg,
stddev(total),
max(total),
min(total)
from {{ ref( 'count_answers_new' ) }}
group by guess
order by avg desc