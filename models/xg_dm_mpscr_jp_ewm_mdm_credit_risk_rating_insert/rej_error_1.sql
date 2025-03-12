
{{config(
  materialized='ephemeral'
)}}

WITH rej_error AS (
SELECT
            		wri_XFM_MDM_CREDIT_RISK_RATING_INS.CR_RSK_RTG_RK AS cr_rsk_rtg_rk,
            	wri_XFM_MDM_CREDIT_RISK_RATING_INS.CR_RSK_RTG_ID AS cr_rsk_rtg_id,
            	wri_XFM_MDM_CREDIT_RISK_RATING_INS.DATE_FROM AS date_from,
            	wri_XFM_MDM_CREDIT_RISK_RATING_INS.DATE_TO AS date_to,
            	wri_XFM_MDM_CREDIT_RISK_RATING_INS.SRC_DL AS src_dl,
            	wri_XFM_MDM_CREDIT_RISK_RATING_INS.SRC_ID AS src_id,
            	wri_XFM_MDM_CREDIT_RISK_RATING_INS.FCY_RK AS fcy_rk,
            	wri_XFM_MDM_CREDIT_RISK_RATING_INS.CST_RK AS cst_rk,
            	wri_XFM_MDM_CREDIT_RISK_RATING_INS.JCO_RK AS jco_rk,
            	wri_XFM_MDM_CREDIT_RISK_RATING_INS.INR_CR_RTG AS inr_cr_rtg,
            	wri_XFM_MDM_CREDIT_RISK_RATING_INS.CR_RSK_RTG_DT AS cr_rsk_rtg_dt,
            	wri_XFM_MDM_CREDIT_RISK_RATING_INS.SRC_TP AS src_tp,
            	wri_XFM_MDM_CREDIT_RISK_RATING_INS.INR_RTG_MDL AS inr_rtg_mdl,
            	wri_XFM_MDM_CREDIT_RISK_RATING_INS.CST_RTG_ST AS cst_rtg_st,
            	wri_XFM_MDM_CREDIT_RISK_RATING_INS.SYS_INRT_TMS AS sys_inrt_tms,
            	wri_XFM_MDM_CREDIT_RISK_RATING_INS.DEL_IN_SRC_STM_F AS del_in_src_stm_f,
            	RejectERRORCODE AS rejecterrorcode,
            	RejectERRORTEXT AS rejecterrortext
        FROM
            ora_write_mdm_credit_risk_rating_ins AS ORA_write_MDM_CREDIT_RISK_RATING_Ins 
)

SELECT * FROM rej_error

