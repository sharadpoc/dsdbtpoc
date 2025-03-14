
{{config(
  materialized='ephemeral'
)}}

WITH mov_jno_ewm_ar_ip_ev AS (
SELECT
            		MOV_SRT_AR_X_IP_ID_SRC_DL AS SRC_DL,
            	MOV_SRT_AR_X_IP_ID_AR_ID AS AR_ID,
            	MOV_SRT_AR_X_IP_ID_IP_ID AS IP_ID,
            	MOV_SRT_IP_X_EV_ID_EV_ID AS EV_ID
        FROM
            {{ ref('jno_ewm_ar_ip_ev') }} AS JNO_EWM_AR_IP_EV 
)

SELECT * FROM mov_jno_ewm_ar_ip_ev

