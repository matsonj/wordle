{{ config(
    tags=["new","opt"]
) }}

SELECT *, ROW_NUMBER() OVER (ORDER BY word) as id
FROM {{ ref( 'guesses' ) }}
