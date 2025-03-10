
{{config(
  materialized='ephemeral'
)}}

WITH rea_ewm_ar_x_cl_rtg_r AS (
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
            	RTG_ST_TP_CL_CD,
            	AR_X_CL_RLTNP_TP_CL_CD
        FROM
            {{ ref('ora_read_ewm_ar_x_cl_rtg_r') }} AS ORA_read_EWM_AR_X_CL_RTG_R 
)

SELECT * FROM rea_ewm_ar_x_cl_rtg_r

