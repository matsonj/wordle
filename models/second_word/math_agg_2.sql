{{ config(
    tags=["new","second"]
) }}

SELECT
  g1,
  g2,
  SUM(total) sum,
  AVG(total) avg,
  stddev(total) stddev,
  MAX(total) max,
  MIN(total) min
from {{ ref( 'count_answers_2' ) }}
group by g1, g2
order by avg desc