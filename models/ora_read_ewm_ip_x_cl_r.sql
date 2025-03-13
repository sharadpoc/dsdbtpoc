
{{config(
  materialized='ephemeral'
)}}

WITH ora_read_ewm_ip_x_cl_r AS (
SELECT
            	IP_ID,
            	IP_X_CL_RLTNP_TP_CL_CD,
            	SRC_DL,
            	EFF_DT
        FROM
            {{ source('xg_ps_rdb_dm_mpscr_database_xg_rdb_dm_schema_mpscr', 'ewm_ip_x_cl_r') }}
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

SELECT * FROM ora_read_ewm_ip_x_cl_r

