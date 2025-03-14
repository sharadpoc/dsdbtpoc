
{{config(
  materialized='ephemeral'
)}}

WITH ora_read_ewm_ip_alt_identn_grid AS (
SELECT
            	IP_ID,
            	IP_ID_NM AS GRID,
            	SRC_DL
        FROM
            {{ source('DM_MPSCR', 'EWM_IP_ALT_IDENTN_M') }}
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
            AND IP_IDENTN_TP_CL_CD='GRID_ID' 
)

SELECT * FROM ora_read_ewm_ip_alt_identn_grid

