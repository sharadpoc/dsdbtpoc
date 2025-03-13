
{{config(
  materialized='ephemeral'
)}}

WITH ora_read_ewm_ip_idv_v AS (
SELECT
            	SRC_DL,
            	IP_ID,
            	VLD_FROM_TMS,
            	MSTR_SRC_STM_CD,
            	CONCAT(CONCAT(MSTR_SRC_STM_CD, '|'), MSTR_SRC_STM_KEY) AS cst_rk,
            	MSTR_SRC_STM_KEY,
            	VLD_TO_TMS
        FROM
            {{ source('DM_MPSCR', 'EWM_IP_IDV_V') }}
        WHERE
            VLD_FROM_TMS <= PARSE_TIMESTAMP(
                    '%Y%m%d%H%M%S',
                    "{{var('xg_pm_selection_date')}}{{var('xg_pm_business_tms')}}"
                )
            AND PARSE_TIMESTAMP(
                    '%Y%m%d%H%M%S',
                    "{{var('xg_pm_selection_date')}}{{var('xg_pm_business_tms')}}"
                ) < VLD_TO_TMS
            AND SRC_DL='{{var("xg_pm_src_dl")}}' 
)

SELECT * FROM ora_read_ewm_ip_idv_v

