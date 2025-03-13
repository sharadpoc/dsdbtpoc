
{{config(
  materialized='ephemeral'
)}}

WITH rea_ewm_ar_x_ip_r AS (
SELECT
            	IP_ID,
            	SRC_DL,
            	AR_X_IP_RLTNP_TP_CL_CD,
            	RANK
        FROM
            {{ ref('ora_read_ewm_ar_x_ip_r') }} AS ORA_read_EWM_AR_X_IP_R
        WHERE
            AR_X_IP_RLTNP_TP_CL_CD='IP_CST_PD_AR'
            AND RANK=1 
)

SELECT * FROM rea_ewm_ar_x_ip_r

