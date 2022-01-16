select guess.*
from {{ ref( 'math_agg_new' ) }} summary
join {{ ref( 'guesses' ) }} guess
    ON guess.word = summary.guess
order by summary.avg desc
limit 500
-- limit is based on visual inspection of matches which shows a breakpoint around the top 500 letters