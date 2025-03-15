
{{config(
  materialized='ephemeral'
)}}

WITH ora_read_ewm_ip_x_ev_r AS (
SELECT
            	SRC_DL,
            	EV_ID,
            	IP_ID,
            	IP_X_EV_RLTNP_TP_CL_CD
        FROM
            {{ source('DM_MPSCR', 'EWM_IP_X_EV_R') }}
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

SELECT * FROM ora_read_ewm_ip_x_ev_r

