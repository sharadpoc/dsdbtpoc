
{{config(
  materialized='ephemeral'
)}}

WITH mov_fnl_fcy_ar_tp AS (
SELECT
            		REA_EWM_AR_DEP_AR_V_AR_IDREA_EWM_AR_SWAP_TXN_V_AR_IDREA_EWM_AR_SCR_TRD_TXN_V_AR_IDREA_EWM_AR_RPRCH_AGRM_TXN_V_AR_IDREA_EWM_AR_OPT_TXN_V_AR_IDREA_EWM_AR_FWD_TXN_V_AR_IDREA_EWM_AR_FX_TXN_V_AR_IDREA_EWM_AR_LOC_AR_V_AR_IDREA_EWM_AR_RCVB_FNC_AR_V_AR_IDREA_EWM_AR_LTROC_AR_V_AR_IDREA_EWM_AR_MRTG_AR_V_AR_IDREA_EWM_AR_LOAN_AR_V_AR_IDREA_EWM_AR_LSE_AR_V_AR_IDREA_EWM_AR_LTR_OF_GNT_AR_V_AR_ID AS AR_ID,
            	REA_EWM_AR_DEP_AR_V_FCY_AR_TPREA_EWM_AR_SWAP_TXN_V_FCY_AR_TPREA_EWM_AR_SCR_TRD_TXN_V_FCY_AR_TPREA_EWM_AR_RPRCH_AGRM_TXN_V_FCY_AR_TPREA_EWM_AR_OPT_TXN_V_FCY_AR_TPREA_EWM_AR_FWD_TXN_V_FCY_AR_TPREA_EWM_AR_FX_TXN_V_FCY_AR_TPREA_EWM_AR_LOC_AR_V_FCY_AR_TPREA_EWM_AR_RCVB_FNC_AR_V_FCY_AR_TPREA_EWM_AR_LTROC_AR_V_FCY_AR_TPREA_EWM_AR_MRTG_AR_V_FCY_AR_TPREA_EWM_AR_LOAN_AR_V_FCY_AR_TPREA_EWM_AR_LSE_AR_V_FCY_AR_TPREA_EWM_AR_LTR_OF_GNT_AR_V_FCY_AR_TP AS FCY_AR_TP,
            	SRC_DL AS SRC_DL,
            	DATA_DT AS DATA_DT,
            	VLD_FROM_TMS AS VLD_FROM_TMS,
            	MSTR_SRC_STM_CD AS MSTR_SRC_STM_CD,
            	MSTR_SRC_STM_KEY AS MSTR_SRC_STM_KEY
        FROM
            {{ ref('fnl_fcy_ar_tp') }} AS FNL_FCY_AR_TP 
)

SELECT * FROM mov_fnl_fcy_ar_tp

