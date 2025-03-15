
{{config(
  materialized='ephemeral'
)}}

WITH ora_read_ewm_mdm_stage_ar_txn AS (
SELECT
            	AR_ID,
            	AR_ID AS PRIM_AR_ID,
            	AR_ID AS OBJ_AR_ID,
            	SRC_DL
        FROM
            {{ source('DM_MPSCR', 'EWM_MDM_STAGE_AR_TX_TRANSACTN') }}
        WHERE
            SRC_DL='{{var("xg_pm_src_dl")}}'
            AND DATA_DT=PARSE_TIMESTAMP(
                    '%Y%m%d',
                    "{{var('xg_pm_selection_date')}}"
                ) 
)

SELECT * FROM ora_read_ewm_mdm_stage_ar_txn

