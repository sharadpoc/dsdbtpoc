
{{config(
  materialized='ephemeral'
)}}

WITH ora_read_ewm_ev_jdcl_ev_v AS (
SELECT
            	SRC_DL,
            	EV_ID,
            	EV_JDCL_EV_V_ID,
            	ACT_STRT_DT,
            	ACT_END_DT
        FROM
            {{ source('DM_MPSCR', 'EWM_EV_JDCL_EV_V') }}
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

SELECT * FROM ora_read_ewm_ev_jdcl_ev_v

