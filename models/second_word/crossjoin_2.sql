SELECT
  guess.g1 AS g1,
  guess.g2 AS g2,
  answers.word AS answer,
  CASE
    WHEN answers.letter_one IN (g1_letter_one, g1_letter_two, g1_letter_three, g1_letter_four, g1_letter_five, g2_letter_one, g2_letter_two, g2_letter_three, g2_letter_four, g2_letter_five ) THEN 1
    ELSE 0
  END AS a1_match,
  CASE
    WHEN answers.letter_two IN (g1_letter_one, g1_letter_two, g1_letter_three, g1_letter_four, g1_letter_five, g2_letter_one, g2_letter_two, g2_letter_three, g2_letter_four, g2_letter_five ) THEN 1
    ELSE 0
  END AS a2_match,
  CASE
    WHEN answers.letter_three IN (g1_letter_one, g1_letter_two, g1_letter_three, g1_letter_four, g1_letter_five, g2_letter_one, g2_letter_two, g2_letter_three, g2_letter_four, g2_letter_five ) THEN 1
    ELSE 0
  END AS a3_match,
  CASE
    WHEN answers.letter_four IN (g1_letter_one, g1_letter_two, g1_letter_three, g1_letter_four, g1_letter_five, g2_letter_one, g2_letter_two, g2_letter_three, g2_letter_four, g2_letter_five ) THEN 1
    ELSE 0
  END AS a4_match,
  CASE
    WHEN answers.letter_five IN (g1_letter_one, g1_letter_two, g1_letter_three, g1_letter_four, g1_letter_five, g2_letter_one, g2_letter_two, g2_letter_three, g2_letter_four, g2_letter_five ) THEN 1
    ELSE 0
  END AS a5_match
FROM {{ ref( 'guesses_2' ) }} guess
CROSS JOIN {{ ref( 'answers' ) }} answers