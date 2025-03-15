
{{config(
  materialized='ephemeral'
)}}

WITH ora_read_ewm_mdm_stage_fcy_ar_tp AS (
SELECT
            	SRC_DL,
            	MSTR_SRC_STM_KEY AS LMTG_AR_MSTR_SRC_STM_KEY,
            	FCY_AR_TP,
            	AR_ID AS OBJ_AR_ID
        FROM
            {{ source('DM_MPSCR', 'EWM_MDM_STAGE_FCY_AR_TP') }}
        WHERE
            DATA_DT=PARSE_TIMESTAMP(
                    '%Y%m%d',
                    "{{var('xg_pm_selection_date')}}"
                )
            AND SRC_DL='{{var("xg_pm_src_dl")}}' 
)

SELECT * FROM ora_read_ewm_mdm_stage_fcy_ar_tp

