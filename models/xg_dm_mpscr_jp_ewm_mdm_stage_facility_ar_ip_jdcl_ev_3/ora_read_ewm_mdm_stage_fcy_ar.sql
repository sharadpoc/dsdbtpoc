
{{config(
  materialized='ephemeral'
)}}

WITH ora_read_ewm_mdm_stage_fcy_ar AS (
SELECT
            	SRC_DL,
            	AR_ID,
            	VLD_FROM_TMS,
            	VLD_TO_TMS,
            	MSTR_SRC_STM_CD,
            	MSTR_SRC_STM_KEY,
            	FCY_RK,
            	DATA_DT
        FROM
            {{ source('DM_MPSCR', 'EWM_MDM_STAGE_FCY_AR') }}
        WHERE
            DATA_DT=PARSE_TIMESTAMP(
                    '%Y%m%d',
                    "{{var('xg_pm_selection_date')}}"
                )
            AND SRC_DL='{{var("xg_pm_src_dl")}}' 
)

SELECT * FROM ora_read_ewm_mdm_stage_fcy_ar

