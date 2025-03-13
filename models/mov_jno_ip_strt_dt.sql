
{{config(
  materialized='ephemeral'
)}}

WITH mov_jno_ip_strt_dt AS (
SELECT
            		mov_JNO_IP_V_IP_ID AS ip_id,
            	mov_JNO_IP_V_CST_RK AS cst_rk,
            	mov_JNO_IP_V_VLD_TO_TMS AS vld_to_tms,
            	mov_JNO_IP_V_CST_VORTEX_ID AS cst_vortex_id,
            	mov_JNO_IP_V_GRID AS grid,
            	mov_RDU_EWM_IP_X_CL_LC_ST_R_EFF_DT AS eff_dt,
            	mov_JNO_IP_V_SRC_DL AS src_dl,
            	mov_JNO_IP_V_MSTR_SRC_STM_CD AS mstr_src_stm_cd,
            	mov_JNO_IP_V_MSTR_SRC_STM_KEY AS mstr_src_stm_key,
            	mov_JNO_IP_V_VLD_FROM_TMS AS vld_from_tms
        FROM
            {{ ref('jno_ip_start_dt') }} AS JNO_IP_START_DT 
)

SELECT * FROM mov_jno_ip_strt_dt

