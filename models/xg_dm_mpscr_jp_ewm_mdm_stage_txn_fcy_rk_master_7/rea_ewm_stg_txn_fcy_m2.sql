
{{config(
  materialized='ephemeral'
)}}

WITH rea_ewm_stg_txn_fcy_m2 AS (
SELECT
            	SRC_DL,
            	OBJ_AR_ID,
            	FCY_RK,
            	DATA_DT
        FROM
            {{ ref('ora_read_ewm_mdm_stage_transaction_fcy_m2') }} AS ORA_READ_EWM_MDM_STAGE_TRANSACTION_FCY
        ORDER BY
            SRC_DL ASC,
            OBJ_AR_ID ASC 
)

SELECT * FROM rea_ewm_stg_txn_fcy_m2

