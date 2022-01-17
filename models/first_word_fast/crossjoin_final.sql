{{ config(
    tags=["new","opt"]
) }}

SELECT * FROM {{ ref( 'crossjoin_part1' ) }}
UNION ALL
SELECT * FROM {{ ref( 'crossjoin_part2' ) }}
UNION ALL
SELECT * FROM {{ ref( 'crossjoin_part3' ) }}
UNION ALL
SELECT * FROM {{ ref( 'crossjoin_part4' ) }}
UNION ALL
SELECT * FROM {{ ref( 'crossjoin_part5' ) }}
UNION ALL
SELECT * FROM {{ ref( 'crossjoin_part6' ) }}