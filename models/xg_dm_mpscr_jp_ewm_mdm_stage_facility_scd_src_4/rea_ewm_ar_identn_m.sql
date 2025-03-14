
{{config(
  materialized='ephemeral'
)}}

WITH rea_ewm_ar_identn_m AS (
SELECT
            	AR_ID,
            	AR_IDENTN_NM,
            	SRC_DL
        FROM
            {{ ref('ora_read_ewm_ar_identn_m') }} AS ORA_READ_EWM_AR_IDENTN_M
        ORDER BY
            SRC_DL ASC,
            AR_ID ASC 
)

SELECT * FROM rea_ewm_ar_identn_m

