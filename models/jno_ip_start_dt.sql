
{{config(
  materialized='ephemeral'
)}}

WITH jno_ip_start_dt AS (
SELECT
            		mov_JNO_IP_V.IP_ID AS mov_jno_ip_v_ip_id,
            	mov_JNO_IP_V.CST_RK AS mov_jno_ip_v_cst_rk,
            	mov_JNO_IP_V.VLD_TO_TMS AS mov_jno_ip_v_vld_to_tms,
            	mov_JNO_IP_V.CST_VORTEX_ID AS mov_jno_ip_v_cst_vortex_id,
            	mov_JNO_IP_V.GRID AS mov_jno_ip_v_grid,
            	mov_JNO_IP_V.SRC_DL AS mov_jno_ip_v_src_dl,
            	mov_JNO_IP_V.MSTR_SRC_STM_CD AS mov_jno_ip_v_mstr_src_stm_cd,
            	mov_JNO_IP_V.MSTR_SRC_STM_KEY AS mov_jno_ip_v_mstr_src_stm_key,
            	mov_JNO_IP_V.VLD_FROM_TMS AS mov_jno_ip_v_vld_from_tms,
            	mov_RDU_EWM_IP_X_CL_LC_ST_R.IP_ID AS mov_rdu_ewm_ip_x_cl_lc_st_r_ip_id,
            	mov_RDU_EWM_IP_X_CL_LC_ST_R.EFF_DT AS mov_rdu_ewm_ip_x_cl_lc_st_r_eff_dt,
            	mov_RDU_EWM_IP_X_CL_LC_ST_R.SRC_DL AS mov_rdu_ewm_ip_x_cl_lc_st_r_src_dl
        FROM
            {{ ref('mov_jno_ip_v') }} AS mov_JNO_IP_V
            LEFT OUTER JOIN {{ ref('mov_rdu_ewm_ip_x_cl_lc_st_r') }} AS mov_RDU_EWM_IP_X_CL_LC_ST_R ON mov_RDU_EWM_IP_X_CL_LC_ST_R.SRC_DL=mov_JNO_IP_V.SRC_DL 
)

SELECT * FROM jno_ip_start_dt

