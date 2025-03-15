
{{config(
  materialized='ephemeral'
)}}

WITH ora_read_ewm_ar_rcvb_fnc_ar_v AS (
SELECT
            	SRC_DL,
            	AR_ID,
            	MSTR_SRC_STM_KEY,
            	MSTR_SRC_STM_CD,
            	VLD_FROM_TMS,
            	PARSE_TIMESTAMP(
                    '%Y%m%d',
                    "{{var('xg_pm_selection_date')}}"
                ) AS DATA_DT,
            	 'RCVB_FNC_AR' AS FCY_AR_TP
        FROM
            {{ source('DM_MPSCR', 'EWM_AR_RCVB_FNC_AR_V') }}
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

SELECT * FROM ora_read_ewm_ar_rcvb_fnc_ar_v

