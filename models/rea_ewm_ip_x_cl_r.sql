
{{config(
  materialized='ephemeral'
)}}

WITH rea_ewm_ip_x_cl_r AS (
SELECT
            	IP_ID,
            	IP_X_CL_RLTNP_TP_CL_CD,
            	SRC_DL,
            	EFF_DT
        FROM
            {{ ref('ora_read_ewm_ip_x_cl_r') }} AS ORA_read_EWM_IP_X_CL_R
        WHERE
            IP_X_CL_RLTNP_TP_CL_CD='CTRP_RLTNP_LCS_TP' 
)

SELECT * FROM rea_ewm_ip_x_cl_r

