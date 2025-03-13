
{{config(
  materialized='ephemeral'
)}}

WITH rea_ewm_cl_jcog_icrrd_m AS (
SELECT
            	SRC_DL,
            	SUBJ_CL_ID,
            	MSTR_SRC_STM_CD,
            	MSTR_SRC_STM_KEY,
            	VLD_FROM_TMS,
            	VLD_TO_TMS,
            	OBJ_CL_CD,
            	EFF_DT,
            	INR_RTG_MODL_CL_CD,
            	RTG_ST_TP_CL_CD,
            	GRP_CL_RLTNP_TP_CL_CD
        FROM
            {{ ref('ora_read_ewm_cl_jcog_x_cl_rtg_r') }} AS ORA_read_EWM_CL_JCOG_X_CL_RTG_R 
        WHERE   
            GRP_CL_RLTNP_TP_CL_CD = 'CR_RTG'
)

SELECT * FROM rea_ewm_cl_jcog_icrrd_m

