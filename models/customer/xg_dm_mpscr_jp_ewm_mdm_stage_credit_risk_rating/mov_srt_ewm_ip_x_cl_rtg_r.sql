
{{config(
  materialized='ephemeral'
)}}

WITH mov_srt_ewm_ip_x_cl_rtg_r AS (
SELECT
            		mov_FLT_IP_X_CL_RLTNP_TP_CL_CD.CL_CD AS cl_cd,
            	mov_FLT_IP_X_CL_RLTNP_TP_CL_CD.EFF_DT AS eff_dt,
            	mov_FLT_IP_X_CL_RLTNP_TP_CL_CD.INR_RTG_MODL_CL_CD AS inr_rtg_modl_cl_cd,
            	mov_FLT_IP_X_CL_RLTNP_TP_CL_CD.RTG_ST_TP_CL_CD AS rtg_st_tp_cl_cd,
            	mov_FLT_IP_X_CL_RLTNP_TP_CL_CD.IP_ID AS ip_id,
            	mov_FLT_IP_X_CL_RLTNP_TP_CL_CD.SRC_DL AS src_dl,
            	mov_FLT_IP_X_CL_RLTNP_TP_CL_CD.MSTR_SRC_STM_CD AS mstr_src_stm_cd,
            	mov_FLT_IP_X_CL_RLTNP_TP_CL_CD.MSTR_SRC_STM_KEY AS mstr_src_stm_key,
            	mov_FLT_IP_X_CL_RLTNP_TP_CL_CD.VLD_FROM_TMS AS vld_from_tms,
            	mov_FLT_IP_X_CL_RLTNP_TP_CL_CD.VLD_TO_TMS AS vld_to_tms
        FROM
            {{ ref('mov_flt_ip_x_cl_rltnp_tp_cl_cd') }} AS mov_FLT_IP_X_CL_RLTNP_TP_CL_CD
		ORDER BY
            src_dl ASC, ip_id ASC 
)

SELECT * FROM mov_srt_ewm_ip_x_cl_rtg_r

