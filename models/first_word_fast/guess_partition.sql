{{ config(
    tags=["new","opt"],
    materialized="table"
) }}

-- Since I have 4 threads, I am creating 4 partitions

SELECT 1 as partition_key, 1 as "start", MAX(id) * 0.25 as "end"
FROM {{ ref( 'guesses_with_id' ) }}
UNION ALL
SELECT 2 as partition_key, MAX(id) * 0.25+1 as "start", MAX(id) * 0.5 as "end"
FROM {{ ref( 'guesses_with_id' ) }}
UNION ALL
SELECT 3 as partition_key, MAX(id) * 0.5+1 as "start", MAX(id) * 0.75 as "end"
FROM {{ ref( 'guesses_with_id' ) }}
UNION ALL 
SELECT 4 as partition_key, MAX(id) * 0.75+1 as "start", MAX(id) as "end"
FROM {{ ref( 'guesses_with_id' ) }}