{{ config(
    tags=["new","second"]
) }}

SELECT 
    g1.word as g1,
    g2.word as g2,
    g1.letter_one as g1_letter_one,
    g1.letter_two as g1_letter_two,
    g1.letter_three as g1_letter_three,
    g1.letter_four as g1_letter_four,
    g1.letter_five as g1_letter_five,
    g2.letter_one as g2_letter_one,
    g2.letter_two as g2_letter_two,
    g2.letter_three as g2_letter_three,
    g2.letter_four as g2_letter_four,
    g2.letter_five as g2_letter_five
from {{ ref( 'guesses' ) }} g2
join {{ ref( 'final_wordlist' ) }} g1 ON 
    g2.word not like '%' || g1.letter_one || '%' and
    g2.word not like '%' || g1.letter_two || '%' and
    g2.word not like '%' || g1.letter_three || '%' and
    g2.word not like '%' || g1.letter_four || '%' and
    g2.word not like '%' || g1.letter_five || '%' 