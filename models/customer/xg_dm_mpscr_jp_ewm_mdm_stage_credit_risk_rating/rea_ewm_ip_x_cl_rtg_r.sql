
{{config(
  materialized='ephemeral'
)}}

WITH rea_ewm_ip_x_cl_rtg_r AS (
SELECT
            	SRC_DL,
            	IP_ID,
            	MSTR_SRC_STM_CD,
            	MSTR_SRC_STM_KEY,
            	VLD_FROM_TMS,
            	VLD_TO_TMS,
            	CL_CD,
            	EFF_DT,
            	INR_RTG_MODL_CL_CD,
            	RTG_ST_TP_CL_CD,
            	IP_X_CL_RLTNP_TP_CL_CD
        FROM
            {{ ref('ora_read_ewm_ip_x_cl_rtg_r') }} AS ORA_read_EWM_IP_X_CL_RTG_R 
        WHERE 
            IP_X_CL_RLTNP_TP_CL_CD = 'IP_CR_RATG'
)

SELECT * FROM rea_ewm_ip_x_cl_rtg_r

