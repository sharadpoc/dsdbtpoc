
{{config(
  materialized='ephemeral'
)}}

WITH mov_tp_cl_cd AS (
SELECT
            		REA_EWM_IP_X_EV_R.SRC_DL AS SRC_DL,
            	REA_EWM_IP_X_EV_R.EV_ID AS EV_ID,
            	REA_EWM_IP_X_EV_R.IP_ID AS IP_ID
        FROM
            {{ ref('rea_ewm_ip_x_ev_r') }} AS REA_EWM_IP_X_EV_R 
)

SELECT * FROM mov_tp_cl_cd

