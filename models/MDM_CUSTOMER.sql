{{ config(
 materialized='incremental',

)}}

        SELECT
             *
        FROM
            {{ ref('mov_cust') }} 