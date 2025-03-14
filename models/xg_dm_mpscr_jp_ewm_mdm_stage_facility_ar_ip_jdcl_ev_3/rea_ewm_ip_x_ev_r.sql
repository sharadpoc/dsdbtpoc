
{{config(
  materialized='ephemeral'
)}}

WITH rea_ewm_ip_x_ev_r AS (
SELECT
            	SRC_DL,
            	EV_ID,
            	IP_ID,
            	IP_X_EV_RLTNP_TP_CL_CD
        FROM
            {{ ref('ora_read_ewm_ip_x_ev_r') }} AS ORA_READ_EWM_IP_X_EV_R
        WHERE
            IP_X_EV_RLTNP_TP_CL_CD='DFNDT' 
)

SELECT * FROM rea_ewm_ip_x_ev_r

