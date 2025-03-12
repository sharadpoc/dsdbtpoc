
{{config(
  materialized='ephemeral'
)}}

WITH ora_read_ewm_cl_jcog_v AS (
SELECT
            	SRC_DL,
            	CL_ID,
            	CONCAT(CONCAT(MSTR_SRC_STM_CD, '|'), MSTR_SRC_STM_KEY) AS jco_rk
        FROM
            {{ source('xg_ps_rdb_dm_mpscr_database.xg_rdb_dm_schema_mpscr', 'ewm_cl_jcog_v') }}
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

SELECT * FROM ora_read_ewm_cl_jcog_v

