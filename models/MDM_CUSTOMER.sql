{{ config(
 materialized='table',

)}}

        SELECT
             *
        FROM
            {{ ref('mov_cust') }} 