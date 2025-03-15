
{{config(
  materialized='ephemeral'
)}}

WITH mov_srt_ewm_ip AS (
SELECT
            		MOV_EWM_IP.IP_ID AS IP_ID,
            	MOV_EWM_IP.CST_RK AS CST_RK,
            	MOV_EWM_IP.VLD_TO_TMS AS VLD_TO_TMS,
            	MOV_EWM_IP.SRC_DL AS SRC_DL,
            	MOV_EWM_IP.MSTR_SRC_STM_CD AS MSTR_SRC_STM_CD,
            	MOV_EWM_IP.MSTR_SRC_STM_KEY AS MSTR_SRC_STM_KEY,
            	MOV_EWM_IP.VLD_FROM_TMS AS VLD_FROM_TMS
        FROM
            {{ ref('mov_ewm_ip') }} AS MOV_EWM_IP
        ORDER BY
            IP_ID ASC,
            SRC_DL ASC 
)

SELECT * FROM mov_srt_ewm_ip

