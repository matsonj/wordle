{{ config(
    tags=["new"]
) }}

select 
guess,
answer,
a1_match + a2_match + a3_match + a4_match + a5_match as total
from {{ ref( 'crossjoin_final' ) }}