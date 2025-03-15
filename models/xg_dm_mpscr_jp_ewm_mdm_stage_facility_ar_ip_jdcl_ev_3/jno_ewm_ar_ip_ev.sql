
{{config(
  materialized='ephemeral'
)}}

WITH jno_ewm_ar_ip_ev AS (
SELECT
            		MOV_SRT_AR_X_IP_ID.SRC_DL AS MOV_SRT_AR_X_IP_ID_SRC_DL,
            	MOV_SRT_AR_X_IP_ID.AR_ID AS MOV_SRT_AR_X_IP_ID_AR_ID,
            	MOV_SRT_AR_X_IP_ID.IP_ID AS MOV_SRT_AR_X_IP_ID_IP_ID,
            	MOV_SRT_IP_X_EV_ID.SRC_DL AS MOV_SRT_IP_X_EV_ID_SRC_DL,
            	MOV_SRT_IP_X_EV_ID.EV_ID AS MOV_SRT_IP_X_EV_ID_EV_ID,
            	MOV_SRT_IP_X_EV_ID.IP_ID AS MOV_SRT_IP_X_EV_ID_IP_ID
        FROM
            {{ ref('mov_srt_ar_x_ip_id') }} AS MOV_SRT_AR_X_IP_ID
            LEFT OUTER JOIN {{ ref('mov_srt_ip_x_ev_id') }} AS MOV_SRT_IP_X_EV_ID ON MOV_SRT_IP_X_EV_ID.SRC_DL=MOV_SRT_AR_X_IP_ID.SRC_DL
            AND MOV_SRT_IP_X_EV_ID.IP_ID=MOV_SRT_AR_X_IP_ID.IP_ID 
)

SELECT * FROM jno_ewm_ar_ip_ev

