
{{config(
  materialized='ephemeral'
)}}

WITH wri_error AS (
SELECT
            		PEEK() AS rec
        FROM
            {{ ref('rej_error') }} AS rej_Error 
)

SELECT * FROM wri_error

