{{ config(
    tags=["new"]
) }}

SELECT 
word,
SUBSTRING(word, 1, 1) letter_one,
SUBSTRING(word, 2, 1) letter_two,
SUBSTRING(word, 3, 1) letter_three,
SUBSTRING(word, 4, 1) letter_four,
SUBSTRING(word, 5, 1) letter_five

FROM read_csv_auto('C:\Users\matso\code\wordle\data\wordle.csv',header=True)