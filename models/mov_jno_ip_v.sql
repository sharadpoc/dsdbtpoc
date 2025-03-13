
{{config(
  materialized='ephemeral'
)}}

WITH mov_jno_ip_v AS (
SELECT
            		mov_SRT_EWM_IP_IP_ID AS ip_id,
            	mov_SRT_EWM_IP_CST_RK AS cst_rk,
            	mov_SRT_EWM_IP_VLD_TO_TMS AS vld_to_tms,
            	mov_SRT_AR_X_IP_R_ROU_CST_VORTEX_ID AS cst_vortex_id,
            	mov_SRT_AR_X_IP_R_ROU_GRID AS grid,
            	mov_SRT_EWM_IP_SRC_DL AS src_dl,
            	mov_SRT_EWM_IP_MSTR_SRC_STM_CD AS mstr_src_stm_cd,
            	mov_SRT_EWM_IP_MSTR_SRC_STM_KEY AS mstr_src_stm_key,
            	mov_SRT_EWM_IP_VLD_FROM_TMS AS vld_from_tms
        FROM
            {{ ref('jno_ip_v') }} AS JNO_IP_V 
)

SELECT * FROM mov_jno_ip_v

