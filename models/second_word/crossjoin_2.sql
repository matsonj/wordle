{{ config(
    tags=["new","second"]
) }}

select
guesses.word as guess,
answers.word as answer,
CASE 
      WHEN answers.letter_one in (guesses.letter_one, guesses.letter_two, guesses.letter_three, guesses.letter_four, guesses.letter_five)   THEN 1
      ELSE 0
end as a1_match,
CASE 
      WHEN answers.letter_two in (guesses.letter_one, guesses.letter_two, guesses.letter_three, guesses.letter_four, guesses.letter_five)   THEN 1
      ELSE 0
end as a2_match,
CASE 
      WHEN answers.letter_three in (guesses.letter_one, guesses.letter_two, guesses.letter_three, guesses.letter_four, guesses.letter_five)   THEN 1
      ELSE 0
end as a3_match,
CASE 
      WHEN answers.letter_four in (guesses.letter_one, guesses.letter_two, guesses.letter_three, guesses.letter_four, guesses.letter_five)   THEN 1
      ELSE 0
end as a4_match,
CASE 
      WHEN answers.letter_five in (guesses.letter_one, guesses.letter_two, guesses.letter_three, guesses.letter_four, guesses.letter_five)   THEN 1
      ELSE 0
end as a5_match
from {{ ref( 'guesses_2' ) }} guesses
cross join  {{ ref( 'answers_2' ) }} answers