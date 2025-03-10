
{{config(
  materialized='ephemeral'
)}}

WITH pek_write_update_error_dropped_records_upd AS (
SELECT
            		rej_Error.CR_RSK_RTG_ID AS rej_error_cr_rsk_rtg_id,
            	rej_Error.DATE_FROM AS rej_error_date_from,
            	rej_Error.DATE_TO AS rej_error_date_to,
            	rej_Error.SYS_INRT_TMS AS rej_error_sys_inrt_tms,
            	rej_Error.SRC_ID AS rej_error_src_id,
            	rej_Error.SRC_DL AS rej_error_src_dl,
            	rej_Error.DEL_IN_SRC_STM_F AS rej_error_del_in_src_stm_f,
            	rej_Error.CR_RSK_RTG_RK AS rej_error_cr_rsk_rtg_rk,
            	rej_Error.CR_RSK_RTG_ID AS rej_error_cr_rsk_rtg_id,
            	rej_Error.DATE_FROM AS rej_error_date_from,
            	rej_Error.DATE_TO AS rej_error_date_to,
            	rej_Error.SRC_DL AS rej_error_src_dl,
            	rej_Error.SRC_ID AS rej_error_src_id,
            	rej_Error.FCY_RK AS rej_error_fcy_rk,
            	rej_Error.CST_RK AS rej_error_cst_rk,
            	rej_Error.JCO_RK AS rej_error_jco_rk,
            	rej_Error.INR_CR_RTG AS rej_error_inr_cr_rtg,
            	rej_Error.CR_RSK_RTG_DT AS rej_error_cr_rsk_rtg_dt,
            	rej_Error.SRC_TP AS rej_error_src_tp,
            	rej_Error.INR_RTG_MDL AS rej_error_inr_rtg_mdl,
            	rej_Error.CST_RTG_ST AS rej_error_cst_rtg_st,
            	rej_Error.SYS_INRT_TMS AS rej_error_sys_inrt_tms,
            	rej_Error.DEL_IN_SRC_STM_F AS rej_error_del_in_src_stm_f,
            	rej_Error.RejectERRORCODE AS rej_error_rejecterrorcode,
            	rej_Error.RejectERRORTEXT AS rej_error_rejecterrortext,
            	rej_Error.CR_RSK_RTG_ID AS rej_error_cr_rsk_rtg_id,
            	rej_Error.DATE_FROM AS rej_error_date_from,
            	rej_Error.DATE_TO AS rej_error_date_to,
            	rej_Error.SYS_INRT_TMS AS rej_error_sys_inrt_tms,
            	rej_Error.SRC_ID AS rej_error_src_id,
            	rej_Error.SRC_DL AS rej_error_src_dl,
            	rej_Error.DEL_IN_SRC_STM_F AS rej_error_del_in_src_stm_f,
            	rej_Error.CR_RSK_RTG_RK AS rej_error_cr_rsk_rtg_rk,
            	rej_Error.CR_RSK_RTG_ID AS rej_error_cr_rsk_rtg_id,
            	rej_Error.DATE_FROM AS rej_error_date_from,
            	rej_Error.DATE_TO AS rej_error_date_to,
            	rej_Error.SRC_DL AS rej_error_src_dl,
            	rej_Error.SRC_ID AS rej_error_src_id,
            	rej_Error.FCY_RK AS rej_error_fcy_rk,
            	rej_Error.CST_RK AS rej_error_cst_rk,
            	rej_Error.JCO_RK AS rej_error_jco_rk,
            	rej_Error.INR_CR_RTG AS rej_error_inr_cr_rtg,
            	rej_Error.CR_RSK_RTG_DT AS rej_error_cr_rsk_rtg_dt,
            	rej_Error.SRC_TP AS rej_error_src_tp,
            	rej_Error.INR_RTG_MDL AS rej_error_inr_rtg_mdl,
            	rej_Error.CST_RTG_ST AS rej_error_cst_rtg_st,
            	rej_Error.SYS_INRT_TMS AS rej_error_sys_inrt_tms,
            	rej_Error.DEL_IN_SRC_STM_F AS rej_error_del_in_src_stm_f,
            	rej_Error.RejectERRORCODE AS rej_error_rejecterrorcode,
            	rej_Error.RejectERRORTEXT AS rej_error_rejecterrortext
        FROM
            (
                    SELECT
                         *
                    FROM
                        {{ ref('rej_error') }} AS rej_Error
                ) 
)

SELECT * FROM pek_write_update_error_dropped_records_upd

