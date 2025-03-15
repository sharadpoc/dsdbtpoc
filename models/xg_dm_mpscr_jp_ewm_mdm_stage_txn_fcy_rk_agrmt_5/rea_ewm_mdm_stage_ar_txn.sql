
{{config(
  materialized='ephemeral'
)}}

WITH rea_ewm_mdm_stage_ar_txn AS (
SELECT
            	AR_ID,
            	SRC_DL,
            	OBJ_AR_ID,
            	PRIM_AR_ID
        FROM
            {{ ref('ora_read_ewm_mdm_stage_ar_txn') }} AS ORA_READ_EWM_MDM_STAGE_AR_TXN
        ORDER BY
            SRC_DL ASC,
            PRIM_AR_ID ASC 
)

SELECT * FROM rea_ewm_mdm_stage_ar_txn

