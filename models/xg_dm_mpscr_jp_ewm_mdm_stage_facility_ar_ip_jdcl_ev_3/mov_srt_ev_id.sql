
{{config(
  materialized='ephemeral'
)}}

WITH mov_srt_ev_id AS (
SELECT
            		MOV_JNO_EWM_AR_IP_EV.SRC_DL AS SRC_DL,
            	MOV_JNO_EWM_AR_IP_EV.AR_ID AS AR_ID,
            	MOV_JNO_EWM_AR_IP_EV.IP_ID AS IP_ID,
            	MOV_JNO_EWM_AR_IP_EV.EV_ID AS EV_ID
        FROM
            {{ ref('mov_jno_ewm_ar_ip_ev') }} AS MOV_JNO_EWM_AR_IP_EV
        ORDER BY
            SRC_DL ASC,
            EV_ID ASC 
)

SELECT * FROM mov_srt_ev_id

