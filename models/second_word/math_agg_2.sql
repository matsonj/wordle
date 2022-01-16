{{ config(
    tags=["new","second"]
) }}

select
guess,
sum(total),
avg(total) avg,
stddev(total),
max(total),
min(total)
from {{ ref( 'count_answers_2' ) }}
group by guess
order by avg desc