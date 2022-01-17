{{ config(
    tags=["new","opt"],
    materialized="table"
) }}

-- Since I have 6 threads, I am creating 6 partitions

SELECT 1 as partition_key, 1 as "start", MAX(id) * 0.167 as "end"
FROM {{ ref( 'guesses_with_id' ) }}
UNION ALL
SELECT 2 as partition_key, MAX(id) * 0.167+1 as "start", MAX(id) * 0.333 as "end"
FROM {{ ref( 'guesses_with_id' ) }}
UNION ALL
SELECT 3 as partition_key, MAX(id) * 0.333+1 as "start", MAX(id) * 0.5 as "end"
FROM {{ ref( 'guesses_with_id' ) }}
UNION ALL 
SELECT 4 as partition_key, MAX(id) * 0.5+1 as "start", MAX(id) * 0.667 as "end"
FROM {{ ref( 'guesses_with_id' ) }}
UNION ALL 
SELECT 5 as partition_key, MAX(id) * 0.667+1 as "start", MAX(id) *0.833 as "end"
FROM {{ ref( 'guesses_with_id' ) }}
UNION ALL 
SELECT 6 as partition_key, MAX(id) * 0.833+1 as "start", MAX(id) as "end"
FROM {{ ref( 'guesses_with_id' ) }}