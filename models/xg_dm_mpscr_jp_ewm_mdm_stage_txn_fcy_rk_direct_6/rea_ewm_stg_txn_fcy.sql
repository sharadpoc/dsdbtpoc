
{{config(
  materialized='ephemeral'
)}}

WITH rea_ewm_stg_txn_fcy AS (
SELECT
            	SRC_DL,
            	PRIM_AR_ID,
            	FCY_RK,
            	DATA_DT
        FROM
            {{ ref('ora_read_ewm_mdm_stage_transaction_fcy') }} AS ORA_READ_EWM_MDM_STAGE_TRANSACTION_FCY
        ORDER BY
            SRC_DL ASC,
            PRIM_AR_ID ASC 
)

SELECT * FROM rea_ewm_stg_txn_fcy

