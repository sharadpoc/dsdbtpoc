
{{config(
  materialized='ephemeral'
)}}

WITH ora_read_ewm_ar_x_ip_r AS (
SELECT
            	IP_ID,
            	AR_X_IP_RLTNP_TP_CL_CD,
            	SRC_DL,
            	RANK
        FROM
            {{ source('DM_MPSCR', 'EWM_AR_X_IP_R') }}
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

SELECT * FROM ora_read_ewm_ar_x_ip_r

