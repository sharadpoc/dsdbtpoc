
{{config(
  materialized='ephemeral'
)}}

WITH ora_read_ewm_ar_mstr_cr_ar_v AS (
SELECT
            		AR_ID AS PRIM_AR_ID,
            	SRC_DL,
            	AR_ID AS SUBJ_AR_ID
        FROM
            {{ source('DM_MPSCR', 'EWM_AR_MSTR_CR_AR_V') }}
        WHERE
            SRC_DL='{{var("xg_pm_src_dl")}}'
            AND VLD_FROM_TMS <= PARSE_TIMESTAMP(
                    '%Y%m%d%H%M%S',
                    "{{var('xg_pm_selection_date')}}{{var('xg_pm_business_tms')}}"
                )
            AND PARSE_TIMESTAMP(
                    '%Y%m%d%H%M%S',
                    "{{var('xg_pm_selection_date')}}{{var('xg_pm_business_tms')}}"
                ) < VLD_TO_TMS 
)

SELECT * FROM ora_read_ewm_ar_mstr_cr_ar_v

