
{{config(
  materialized='ephemeral'
)}}

WITH ora_read_ewm_ar_x_cl_fnc_st_r AS (
SELECT
            	SRC_DL,
            	AR_ID,
            	CL_CD AS AR_CL_CD
        FROM
            {{ source('DM_MPSCR', 'EWM_AR_X_CL_FNC_ST_R') }}
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
            AND CL_CD IN('IN_DFLT_AR', 'IN_DFLT_AR_W_PRBTN', 'IN_DFLT_AR_W_NO_PRBTN') 
)

SELECT * FROM ora_read_ewm_ar_x_cl_fnc_st_r

