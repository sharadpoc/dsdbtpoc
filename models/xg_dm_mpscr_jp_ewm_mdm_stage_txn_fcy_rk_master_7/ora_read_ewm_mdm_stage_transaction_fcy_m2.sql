
{{config(
  materialized='ephemeral'
)}}

WITH ora_read_ewm_mdm_stage_transaction_fcy_m2 AS (
SELECT
            	SRC_DL,
            	AR_ID AS OBJ_AR_ID,
            	FCY_RK,
            	DATA_DT
        FROM
            {{ source('DM_MPSCR', 'EWM_MDM_STAGE_TRANSACTION_FCY') }}
        WHERE
            DATA_DT=PARSE_TIMESTAMP(
                    '%Y%m%d',
                    "{{var('xg_pm_selection_date')}}"
                )
            AND SRC_DL='{{var("xg_pm_src_dl")}}' 
)

SELECT * FROM ora_read_ewm_mdm_stage_transaction_fcy_m2

