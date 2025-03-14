
{{config(
  materialized='ephemeral'
)}}

WITH ora_read_ewm_ar_identn_m AS (
SELECT
            	AR_ID,
            	AR_IDENTN_NM,
            	SRC_DL
        FROM
            {{ source('DM_MPSCR', 'EWM_AR_IDENTN_M') }}
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
            AND AR_IDENTN_TP_CL_CD='LCL_VORTEX_IDENT' 
)

SELECT * FROM ora_read_ewm_ar_identn_m

