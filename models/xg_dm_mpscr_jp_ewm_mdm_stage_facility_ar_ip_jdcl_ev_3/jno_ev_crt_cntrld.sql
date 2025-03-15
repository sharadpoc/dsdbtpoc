
{{config(
  materialized='ephemeral'
)}}

WITH jno_ev_crt_cntrld AS (
SELECT
            		MOV_SRT_EV_ID.SRC_DL AS MOV_SRT_EV_ID_SRC_DL,
            	MOV_SRT_EV_ID.AR_ID AS MOV_SRT_EV_ID_AR_ID,
            	MOV_SRT_EV_ID.IP_ID AS MOV_SRT_EV_ID_IP_ID,
            	MOV_SRT_EV_ID.EV_ID AS MOV_SRT_EV_ID_EV_ID,
            	MOV_SRT_JDCL_CRT_CTRL.SRC_DL AS MOV_SRT_JDCL_CRT_CTRL_SRC_DL,
            	MOV_SRT_JDCL_CRT_CTRL.EV_ID AS MOV_SRT_JDCL_CRT_CTRL_EV_ID,
            	MOV_SRT_JDCL_CRT_CTRL.EV_JDCL_EV_V_ID AS MOV_SRT_JDCL_CRT_CTRL_EV_JDCL_EV_V_ID,
            	MOV_SRT_JDCL_CRT_CTRL.ACT_STRT_DT AS MOV_SRT_JDCL_CRT_CTRL_ACT_STRT_DT,
            	MOV_SRT_JDCL_CRT_CTRL.ACT_END_DT AS MOV_SRT_JDCL_CRT_CTRL_ACT_END_DT
        FROM
            {{ ref('mov_srt_ev_id') }} AS MOV_SRT_EV_ID
            LEFT OUTER JOIN {{ ref('mov_srt_jdcl_crt_ctrl') }} AS MOV_SRT_JDCL_CRT_CTRL ON MOV_SRT_JDCL_CRT_CTRL.SRC_DL=MOV_SRT_EV_ID.SRC_DL
            AND MOV_SRT_JDCL_CRT_CTRL.EV_ID=MOV_SRT_EV_ID.EV_ID 
)

SELECT * FROM jno_ev_crt_cntrld

