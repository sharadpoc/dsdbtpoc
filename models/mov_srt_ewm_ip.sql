
{{config(
  materialized='ephemeral'
)}}

WITH mov_srt_ewm_ip AS (
SELECT
            		mov_EWM_IP.IP_ID AS ip_id,
            	mov_EWM_IP.CST_RK AS cst_rk,
            	mov_EWM_IP.VLD_TO_TMS AS vld_to_tms,
            	mov_EWM_IP.SRC_DL AS src_dl,
            	mov_EWM_IP.MSTR_SRC_STM_CD AS mstr_src_stm_cd,
            	mov_EWM_IP.MSTR_SRC_STM_KEY AS mstr_src_stm_key,
            	mov_EWM_IP.VLD_FROM_TMS AS vld_from_tms
        FROM
            {{ ref('mov_ewm_ip') }} AS mov_EWM_IP
        ORDER BY
            IP_ID ASC,
            SRC_DL ASC 
)

SELECT * FROM mov_srt_ewm_ip

