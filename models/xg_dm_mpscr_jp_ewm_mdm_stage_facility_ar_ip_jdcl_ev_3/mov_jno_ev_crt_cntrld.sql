
{{config(
  materialized='ephemeral'
)}}

WITH mov_jno_ev_crt_cntrld AS (
SELECT
            		MOV_SRT_EV_ID_SRC_DL AS SRC_DL,
            	MOV_SRT_EV_ID_EV_ID AS EV_ID,
            	MOV_SRT_JDCL_CRT_CTRL_EV_JDCL_EV_V_ID AS EV_JDCL_EV_V_ID,
            	MOV_SRT_JDCL_CRT_CTRL_ACT_STRT_DT AS ACT_STRT_DT,
            	MOV_SRT_JDCL_CRT_CTRL_ACT_END_DT AS ACT_END_DT,
            	MOV_SRT_EV_ID_AR_ID AS AR_ID,
            	MOV_SRT_EV_ID_IP_ID AS IP_ID
        FROM
            {{ ref('jno_ev_crt_cntrld') }} AS JNO_EV_CRT_CNTRLD 
)

SELECT * FROM mov_jno_ev_crt_cntrld

