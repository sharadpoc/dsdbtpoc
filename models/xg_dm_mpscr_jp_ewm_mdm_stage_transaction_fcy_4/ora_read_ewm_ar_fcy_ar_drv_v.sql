
{{config(
  materialized='ephemeral'
)}}

WITH ora_read_ewm_ar_fcy_ar_drv_v AS (
SELECT
            		CONCAT(CONCAT(MSTR_SRC_STM_CD, '|'), MSTR_SRC_STM_KEY) AS FCY_RK,
            	SRC_DL,
            	AR_ID,
            	VLD_FROM_TMS,
            	PARSE_TIMESTAMP(
                    '%Y%m%d',
                    "{{var('xg_pm_selection_date')}}"
                ) AS DATA_DT
        FROM
            {{ source('DM_MPSCR', 'EWM_AR_FCY_AR_DRV_V') }}
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

SELECT * FROM ora_read_ewm_ar_fcy_ar_drv_v

