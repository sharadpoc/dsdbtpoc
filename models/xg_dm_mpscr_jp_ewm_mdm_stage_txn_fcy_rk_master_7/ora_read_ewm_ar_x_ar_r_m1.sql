
{{config(
  materialized='ephemeral'
)}}

WITH ora_read_ewm_ar_x_ar_r_m1 AS (
SELECT
            	OBJ_AR_ID,
            	SRC_DL,
            	SUBJ_AR_ID
        FROM
            {{ source('DM_MPSCR', 'EWM_AR_X_AR_R') }}
        WHERE
            SRC_DL='{{var("xg_pm_src_dl")}}'
            AND AR_X_AR_RLTNP_TP_CL_CD='AR_MASTER_AR_FM_TXN'
            AND VLD_FROM_TMS <= PARSE_TIMESTAMP(
                    '%Y%m%d%H%M%S',
                    "{{var('xg_pm_selection_date')}}{{var('xg_pm_business_tms')}}"
                )
            AND PARSE_TIMESTAMP(
                    '%Y%m%d%H%M%S',
                    "{{var('xg_pm_selection_date')}}{{var('xg_pm_business_tms')}}"
                ) < VLD_TO_TMS 
)

SELECT * FROM ora_read_ewm_ar_x_ar_r_m1

