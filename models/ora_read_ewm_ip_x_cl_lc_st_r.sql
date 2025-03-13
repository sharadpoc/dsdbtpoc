
{{config(
  materialized='ephemeral'
)}}

WITH ora_read_ewm_ip_x_cl_lc_st_r AS (
SELECT
            	IP_ID,
            	EFF_DT,
            	CL_CD,
            	SRC_DL
        FROM
            {{ source('DM_MPSCR', 'EWM_IP_X_CL_LC_ST_R') }}
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

SELECT * FROM ora_read_ewm_ip_x_cl_lc_st_r

