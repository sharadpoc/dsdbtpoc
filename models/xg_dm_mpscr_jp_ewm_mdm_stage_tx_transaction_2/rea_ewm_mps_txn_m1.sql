
{{config(
  materialized='ephemeral'
)}}

WITH rea_ewm_mps_txn_m1 AS (
SELECT
            	SRC_DL,
            	AR_ID,
            	VLD_FROM_TMS
        FROM
            {{ ref('ora_read_ewm_txn') }} AS ORA_READ_EWM_TXN 
)

SELECT * FROM rea_ewm_mps_txn_m1

