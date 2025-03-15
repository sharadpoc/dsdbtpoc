
{{config(
  materialized='ephemeral'
)}}

WITH ora_read_ewm_ar_mrtg_ar_v AS (
SELECT
            	SRC_DL,
            	PARSE_TIMESTAMP(
                    '%Y%m%d',
                    "{{var('xg_pm_selection_date')}}"
                ) AS DATA_DT,
            	VLD_FROM_TMS,
            	MSTR_SRC_STM_CD,
            	MSTR_SRC_STM_KEY,
            	AR_ID,
            	 'MRTG_AR' AS FCY_AR_TP
        FROM
            {{ source('DM_MPSCR', 'EWM_AR_MRTG_AR_V') }}
        WHERE
            1=1
            AND SRC_DL='{{var("xg_pm_src_dl")}}'
            AND VLD_FROM_TMS <= PARSE_TIMESTAMP(
                    '%Y%m%d%H%M%S',
                    "{{var('xg_pm_selection_date')}}{{var('xg_pm_business_tms')}}"
                )
            AND PARSE_TIMESTAMP(
                    '%Y%m%d%H%M%S',
                    "{{var('xg_pm_selection_date')}}{{var('xg_pm_business_tms')}}"
                ) < VLD_TO_TMS 
)

SELECT * FROM ora_read_ewm_ar_mrtg_ar_v

