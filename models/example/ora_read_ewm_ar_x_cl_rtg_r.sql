
{{config(
  materialized='ephemeral'
)}}

WITH ora_read_ewm_ar_x_cl_rtg_r AS (
SELECT
        	SRC_DL,
        	AR_ID,
        	MSTR_SRC_STM_CD,
        	MSTR_SRC_STM_KEY,
        	VLD_FROM_TMS,
        	VLD_TO_TMS,
        	CL_CD,
        	EFF_DT,
        	INR_RTG_MODL_CL_CD,
        	null AS rtg_st_tp_cl_cd,
        	AR_X_CL_RLTNP_TP_CL_CD
    FROM
        {{ source('xg_ps_rdb_dm_mpscr_database.xg_rdb_dm_schema_mpscr', 'ewm_ar_x_cl_rtg_r') }}
    WHERE
        SRC_DL='{{ var(' xg_pm_src_dl ')}} AND VLD_FROM_TMS <= PARSE_TIMESTAMP AND PARSE_TIMESTAMP < VLD_TO_TMS

)

SELECT * FROM ora_read_ewm_ar_x_cl_rtg_r

