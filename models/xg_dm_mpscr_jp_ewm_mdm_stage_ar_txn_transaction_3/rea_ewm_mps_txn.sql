
{{config(
  materialized='ephemeral'
)}}

WITH rea_ewm_mps_txn AS (
SELECT
            	SRC_DL,
            	AR_ID,
            	VLD_FROM_TMS,
            	DATA_DT,
            	SYS_INRT_TMS
        FROM
            {{ ref('ora_read_ewm_stage_ar_txn_transaction_union') }} AS ORA_READ_EWM_STAGE_AR_TXN_TRANSACTION_UNION
        ORDER BY
            AR_ID ASC,
            VLD_FROM_TMS ASC,
            SRC_DL ASC 
)

SELECT * FROM rea_ewm_mps_txn

