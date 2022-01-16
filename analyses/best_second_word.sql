--If no matches on the first word, best second word
select * from {{ ref( 'wordle' ) }}
where 
word like ('%i%')
and
word like ('%l%')
and
word like ('%t%')
and
word like ('%n%')
and
word like ('%u%')
