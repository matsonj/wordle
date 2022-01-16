{{ config(
    tags=["new","second"],
    materialized = "view"
) }}

SELECT
  g1,
  g2,
  answer,
  a1_match + a2_match + a3_match + a4_match + a5_match AS total
from {{ ref( 'crossjoin_2' ) }}