
{{config(
  materialized='ephemeral'
)}}

WITH ora_read_ewm_ev_x_cl_r AS (
SELECT
            	EV_ID,
            	CL_CD,
            	SRC_DL
        FROM
            {{ source('DM_MPSCR', 'EWM_EV_X_CL_R') }}
        WHERE
            SRC_DL='{{var("xg_pm_src_dl")}}'
            AND EV_X_CL_RLTNP_TP_CL_CD='SRC_FND_TP'
            AND VLD_FROM_TMS <= PARSE_TIMESTAMP(
                    '%Y%m%d%H%M%S',
                    "{{var('xg_pm_selection_date')}}{{var('xg_pm_business_tms')}}"
                )
            AND PARSE_TIMESTAMP(
                    '%Y%m%d%H%M%S',
                    "{{var('xg_pm_selection_date')}}{{var('xg_pm_business_tms')}}"
                ) < VLD_TO_TMS 
)

SELECT * FROM ora_read_ewm_ev_x_cl_r

