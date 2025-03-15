
{{config(
  materialized='ephemeral'
)}}

WITH fnl_fcy_ar_tp AS (
SELECT
                    		REA_EWM_AR_SCR_TRD_TXN_V.SRC_DL AS REA_EWM_AR_SCR_TRD_TXN_V_SRC_DL,
                    	REA_EWM_AR_SCR_TRD_TXN_V.DATA_DT AS REA_EWM_AR_SCR_TRD_TXN_V_DATA_DT,
                    	REA_EWM_AR_SCR_TRD_TXN_V.VLD_FROM_TMS AS REA_EWM_AR_SCR_TRD_TXN_V_VLD_FROM_TMS,
                    	REA_EWM_AR_SCR_TRD_TXN_V.MSTR_SRC_STM_CD AS REA_EWM_AR_SCR_TRD_TXN_V_MSTR_SRC_STM_CD,
                    	REA_EWM_AR_SCR_TRD_TXN_V.MSTR_SRC_STM_KEY AS REA_EWM_AR_SCR_TRD_TXN_V_MSTR_SRC_STM_KEY,
                    	REA_EWM_AR_SCR_TRD_TXN_V.AR_ID AS REA_EWM_AR_SCR_TRD_TXN_V_AR_ID,
                    	REA_EWM_AR_SCR_TRD_TXN_V.FCY_AR_TP AS REA_EWM_AR_SCR_TRD_TXN_V_FCY_AR_TP
                FROM
                    {{ ref('rea_ewm_ar_scr_trd_txn_v') }} AS REA_EWM_AR_SCR_TRD_TXN_V
                UNION DISTINCT
                SELECT
                    		REA_EWM_AR_RCVB_FNC_AR_V.SRC_DL AS REA_EWM_AR_RCVB_FNC_AR_V_SRC_DL,
                    	REA_EWM_AR_RCVB_FNC_AR_V.AR_ID AS REA_EWM_AR_RCVB_FNC_AR_V_AR_ID,
                    	REA_EWM_AR_RCVB_FNC_AR_V.MSTR_SRC_STM_CD AS REA_EWM_AR_RCVB_FNC_AR_V_MSTR_SRC_STM_CD,
                    	REA_EWM_AR_RCVB_FNC_AR_V.FCY_AR_TP AS REA_EWM_AR_RCVB_FNC_AR_V_FCY_AR_TP,
                    	REA_EWM_AR_RCVB_FNC_AR_V.MSTR_SRC_STM_KEY AS REA_EWM_AR_RCVB_FNC_AR_V_MSTR_SRC_STM_KEY,
                    	REA_EWM_AR_RCVB_FNC_AR_V.VLD_FROM_TMS AS REA_EWM_AR_RCVB_FNC_AR_V_VLD_FROM_TMS,
                    	REA_EWM_AR_RCVB_FNC_AR_V.DATA_DT AS REA_EWM_AR_RCVB_FNC_AR_V_DATA_DT
                FROM
                    {{ ref('rea_ewm_ar_rcvb_fnc_ar_v') }} AS REA_EWM_AR_RCVB_FNC_AR_V
                UNION DISTINCT
                SELECT
                    		REA_EWM_AR_LTROC_AR_V.SRC_DL AS REA_EWM_AR_LTROC_AR_V_SRC_DL,
                    	REA_EWM_AR_LTROC_AR_V.DATA_DT AS REA_EWM_AR_LTROC_AR_V_DATA_DT,
                    	REA_EWM_AR_LTROC_AR_V.VLD_FROM_TMS AS REA_EWM_AR_LTROC_AR_V_VLD_FROM_TMS,
                    	REA_EWM_AR_LTROC_AR_V.MSTR_SRC_STM_CD AS REA_EWM_AR_LTROC_AR_V_MSTR_SRC_STM_CD,
                    	REA_EWM_AR_LTROC_AR_V.MSTR_SRC_STM_KEY AS REA_EWM_AR_LTROC_AR_V_MSTR_SRC_STM_KEY,
                    	REA_EWM_AR_LTROC_AR_V.AR_ID AS REA_EWM_AR_LTROC_AR_V_AR_ID,
                    	REA_EWM_AR_LTROC_AR_V.FCY_AR_TP AS REA_EWM_AR_LTROC_AR_V_FCY_AR_TP
                FROM
                    {{ ref('rea_ewm_ar_ltroc_ar_v') }} AS REA_EWM_AR_LTROC_AR_V
                UNION DISTINCT
                SELECT
                    		REA_EWM_AR_LTR_OF_GNT_AR_V.SRC_DL AS REA_EWM_AR_LTR_OF_GNT_AR_V_SRC_DL,
                    	REA_EWM_AR_LTR_OF_GNT_AR_V.DATA_DT AS REA_EWM_AR_LTR_OF_GNT_AR_V_DATA_DT,
                    	REA_EWM_AR_LTR_OF_GNT_AR_V.VLD_FROM_TMS AS REA_EWM_AR_LTR_OF_GNT_AR_V_VLD_FROM_TMS,
                    	REA_EWM_AR_LTR_OF_GNT_AR_V.MSTR_SRC_STM_CD AS REA_EWM_AR_LTR_OF_GNT_AR_V_MSTR_SRC_STM_CD,
                    	REA_EWM_AR_LTR_OF_GNT_AR_V.MSTR_SRC_STM_KEY AS REA_EWM_AR_LTR_OF_GNT_AR_V_MSTR_SRC_STM_KEY,
                    	REA_EWM_AR_LTR_OF_GNT_AR_V.AR_ID AS REA_EWM_AR_LTR_OF_GNT_AR_V_AR_ID,
                    	REA_EWM_AR_LTR_OF_GNT_AR_V.FCY_AR_TP AS REA_EWM_AR_LTR_OF_GNT_AR_V_FCY_AR_TP
                FROM
                    {{ ref('rea_ewm_ar_ltr_of_gnt_ar_v') }} AS REA_EWM_AR_LTR_OF_GNT_AR_V
                UNION DISTINCT
                SELECT
                    		REA_EWM_AR_FWD_TXN_V.SRC_DL AS REA_EWM_AR_FWD_TXN_V_SRC_DL,
                    	REA_EWM_AR_FWD_TXN_V.DATA_DT AS REA_EWM_AR_FWD_TXN_V_DATA_DT,
                    	REA_EWM_AR_FWD_TXN_V.VLD_FROM_TMS AS REA_EWM_AR_FWD_TXN_V_VLD_FROM_TMS,
                    	REA_EWM_AR_FWD_TXN_V.MSTR_SRC_STM_CD AS REA_EWM_AR_FWD_TXN_V_MSTR_SRC_STM_CD,
                    	REA_EWM_AR_FWD_TXN_V.MSTR_SRC_STM_KEY AS REA_EWM_AR_FWD_TXN_V_MSTR_SRC_STM_KEY,
                    	REA_EWM_AR_FWD_TXN_V.AR_ID AS REA_EWM_AR_FWD_TXN_V_AR_ID,
                    	REA_EWM_AR_FWD_TXN_V.FCY_AR_TP AS REA_EWM_AR_FWD_TXN_V_FCY_AR_TP
                FROM
                    {{ ref('rea_ewm_ar_fwd_txn_v') }} AS REA_EWM_AR_FWD_TXN_V
                UNION DISTINCT
                SELECT
                    		REA_EWM_AR_DEP_AR_V.SRC_DL AS REA_EWM_AR_DEP_AR_V_SRC_DL,
                    	REA_EWM_AR_DEP_AR_V.DATA_DT AS REA_EWM_AR_DEP_AR_V_DATA_DT,
                    	REA_EWM_AR_DEP_AR_V.VLD_FROM_TMS AS REA_EWM_AR_DEP_AR_V_VLD_FROM_TMS,
                    	REA_EWM_AR_DEP_AR_V.MSTR_SRC_STM_CD AS REA_EWM_AR_DEP_AR_V_MSTR_SRC_STM_CD,
                    	REA_EWM_AR_DEP_AR_V.MSTR_SRC_STM_KEY AS REA_EWM_AR_DEP_AR_V_MSTR_SRC_STM_KEY,
                    	REA_EWM_AR_DEP_AR_V.AR_ID AS REA_EWM_AR_DEP_AR_V_AR_ID,
                    	REA_EWM_AR_DEP_AR_V.FCY_AR_TP AS REA_EWM_AR_DEP_AR_V_FCY_AR_TP
                FROM
                    {{ ref('rea_ewm_ar_dep_ar_v') }} AS REA_EWM_AR_DEP_AR_V
                UNION DISTINCT
                SELECT
                    		REA_EWM_AR_LOAN_AR_V.SRC_DL AS REA_EWM_AR_LOAN_AR_V_SRC_DL,
                    	REA_EWM_AR_LOAN_AR_V.DATA_DT AS REA_EWM_AR_LOAN_AR_V_DATA_DT,
                    	REA_EWM_AR_LOAN_AR_V.VLD_FROM_TMS AS REA_EWM_AR_LOAN_AR_V_VLD_FROM_TMS,
                    	REA_EWM_AR_LOAN_AR_V.MSTR_SRC_STM_CD AS REA_EWM_AR_LOAN_AR_V_MSTR_SRC_STM_CD,
                    	REA_EWM_AR_LOAN_AR_V.MSTR_SRC_STM_KEY AS REA_EWM_AR_LOAN_AR_V_MSTR_SRC_STM_KEY,
                    	REA_EWM_AR_LOAN_AR_V.AR_ID AS REA_EWM_AR_LOAN_AR_V_AR_ID,
                    	REA_EWM_AR_LOAN_AR_V.FCY_AR_TP AS REA_EWM_AR_LOAN_AR_V_FCY_AR_TP
                FROM
                    {{ ref('rea_ewm_ar_loan_ar_v') }} AS REA_EWM_AR_LOAN_AR_V
                UNION DISTINCT
                SELECT
                    		REA_EWM_AR_LSE_AR_V.SRC_DL AS REA_EWM_AR_LSE_AR_V_SRC_DL,
                    	REA_EWM_AR_LSE_AR_V.DATA_DT AS REA_EWM_AR_LSE_AR_V_DATA_DT,
                    	REA_EWM_AR_LSE_AR_V.VLD_FROM_TMS AS REA_EWM_AR_LSE_AR_V_VLD_FROM_TMS,
                    	REA_EWM_AR_LSE_AR_V.MSTR_SRC_STM_CD AS REA_EWM_AR_LSE_AR_V_MSTR_SRC_STM_CD,
                    	REA_EWM_AR_LSE_AR_V.MSTR_SRC_STM_KEY AS REA_EWM_AR_LSE_AR_V_MSTR_SRC_STM_KEY,
                    	REA_EWM_AR_LSE_AR_V.AR_ID AS REA_EWM_AR_LSE_AR_V_AR_ID,
                    	REA_EWM_AR_LSE_AR_V.FCY_AR_TP AS REA_EWM_AR_LSE_AR_V_FCY_AR_TP
                FROM
                    {{ ref('rea_ewm_ar_lse_ar_v') }} AS REA_EWM_AR_LSE_AR_V
                UNION DISTINCT
                SELECT
                    		REA_EWM_AR_FX_TXN_V.SRC_DL AS REA_EWM_AR_FX_TXN_V_SRC_DL,
                    	REA_EWM_AR_FX_TXN_V.DATA_DT AS REA_EWM_AR_FX_TXN_V_DATA_DT,
                    	REA_EWM_AR_FX_TXN_V.VLD_FROM_TMS AS REA_EWM_AR_FX_TXN_V_VLD_FROM_TMS,
                    	REA_EWM_AR_FX_TXN_V.MSTR_SRC_STM_CD AS REA_EWM_AR_FX_TXN_V_MSTR_SRC_STM_CD,
                    	REA_EWM_AR_FX_TXN_V.MSTR_SRC_STM_KEY AS REA_EWM_AR_FX_TXN_V_MSTR_SRC_STM_KEY,
                    	REA_EWM_AR_FX_TXN_V.AR_ID AS REA_EWM_AR_FX_TXN_V_AR_ID,
                    	REA_EWM_AR_FX_TXN_V.FCY_AR_TP AS REA_EWM_AR_FX_TXN_V_FCY_AR_TP
                FROM
                    {{ ref('rea_ewm_ar_fx_txn_v') }} AS REA_EWM_AR_FX_TXN_V
                UNION DISTINCT
                SELECT
                    		REA_EWM_AR_OPT_TXN_V.SRC_DL AS REA_EWM_AR_OPT_TXN_V_SRC_DL,
                    	REA_EWM_AR_OPT_TXN_V.DATA_DT AS REA_EWM_AR_OPT_TXN_V_DATA_DT,
                    	REA_EWM_AR_OPT_TXN_V.VLD_FROM_TMS AS REA_EWM_AR_OPT_TXN_V_VLD_FROM_TMS,
                    	REA_EWM_AR_OPT_TXN_V.MSTR_SRC_STM_CD AS REA_EWM_AR_OPT_TXN_V_MSTR_SRC_STM_CD,
                    	REA_EWM_AR_OPT_TXN_V.MSTR_SRC_STM_KEY AS REA_EWM_AR_OPT_TXN_V_MSTR_SRC_STM_KEY,
                    	REA_EWM_AR_OPT_TXN_V.AR_ID AS REA_EWM_AR_OPT_TXN_V_AR_ID,
                    	REA_EWM_AR_OPT_TXN_V.FCY_AR_TP AS REA_EWM_AR_OPT_TXN_V_FCY_AR_TP
                FROM
                    {{ ref('rea_ewm_ar_opt_txn_v') }} AS REA_EWM_AR_OPT_TXN_V
                UNION DISTINCT
                SELECT
                    		REA_EWM_AR_SWAP_TXN_V.SRC_DL AS REA_EWM_AR_SWAP_TXN_V_SRC_DL,
                    	REA_EWM_AR_SWAP_TXN_V.DATA_DT AS REA_EWM_AR_SWAP_TXN_V_DATA_DT,
                    	REA_EWM_AR_SWAP_TXN_V.VLD_FROM_TMS AS REA_EWM_AR_SWAP_TXN_V_VLD_FROM_TMS,
                    	REA_EWM_AR_SWAP_TXN_V.MSTR_SRC_STM_CD AS REA_EWM_AR_SWAP_TXN_V_MSTR_SRC_STM_CD,
                    	REA_EWM_AR_SWAP_TXN_V.MSTR_SRC_STM_KEY AS REA_EWM_AR_SWAP_TXN_V_MSTR_SRC_STM_KEY,
                    	REA_EWM_AR_SWAP_TXN_V.AR_ID AS REA_EWM_AR_SWAP_TXN_V_AR_ID,
                    	REA_EWM_AR_SWAP_TXN_V.FCY_AR_TP AS REA_EWM_AR_SWAP_TXN_V_FCY_AR_TP
                FROM
                    {{ ref('rea_ewm_ar_swap_txn_v') }} AS REA_EWM_AR_SWAP_TXN_V
                UNION DISTINCT
                SELECT
                    		REA_EWM_AR_RPRCH_AGRM_TXN_V.SRC_DL AS REA_EWM_AR_RPRCH_AGRM_TXN_V_SRC_DL,
                    	REA_EWM_AR_RPRCH_AGRM_TXN_V.DATA_DT AS REA_EWM_AR_RPRCH_AGRM_TXN_V_DATA_DT,
                    	REA_EWM_AR_RPRCH_AGRM_TXN_V.VLD_FROM_TMS AS REA_EWM_AR_RPRCH_AGRM_TXN_V_VLD_FROM_TMS,
                    	REA_EWM_AR_RPRCH_AGRM_TXN_V.MSTR_SRC_STM_CD AS REA_EWM_AR_RPRCH_AGRM_TXN_V_MSTR_SRC_STM_CD,
                    	REA_EWM_AR_RPRCH_AGRM_TXN_V.MSTR_SRC_STM_KEY AS REA_EWM_AR_RPRCH_AGRM_TXN_V_MSTR_SRC_STM_KEY,
                    	REA_EWM_AR_RPRCH_AGRM_TXN_V.AR_ID AS REA_EWM_AR_RPRCH_AGRM_TXN_V_AR_ID,
                    	REA_EWM_AR_RPRCH_AGRM_TXN_V.FCY_AR_TP AS REA_EWM_AR_RPRCH_AGRM_TXN_V_FCY_AR_TP
                FROM
                    {{ ref('rea_ewm_ar_rprch_agrm_txn_v') }} AS REA_EWM_AR_RPRCH_AGRM_TXN_V
                UNION DISTINCT
                SELECT
                    		REA_EWM_AR_LOC_AR_V.SRC_DL AS REA_EWM_AR_LOC_AR_V_SRC_DL,
                    	REA_EWM_AR_LOC_AR_V.DATA_DT AS REA_EWM_AR_LOC_AR_V_DATA_DT,
                    	REA_EWM_AR_LOC_AR_V.VLD_FROM_TMS AS REA_EWM_AR_LOC_AR_V_VLD_FROM_TMS,
                    	REA_EWM_AR_LOC_AR_V.MSTR_SRC_STM_CD AS REA_EWM_AR_LOC_AR_V_MSTR_SRC_STM_CD,
                    	REA_EWM_AR_LOC_AR_V.MSTR_SRC_STM_KEY AS REA_EWM_AR_LOC_AR_V_MSTR_SRC_STM_KEY,
                    	REA_EWM_AR_LOC_AR_V.AR_ID AS REA_EWM_AR_LOC_AR_V_AR_ID,
                    	REA_EWM_AR_LOC_AR_V.FCY_AR_TP AS REA_EWM_AR_LOC_AR_V_FCY_AR_TP
                FROM
                    {{ ref('rea_ewm_ar_loc_ar_v') }} AS REA_EWM_AR_LOC_AR_V
                UNION DISTINCT
                SELECT
                    		REA_EWM_AR_MRTG_AR_V.SRC_DL AS REA_EWM_AR_MRTG_AR_V_SRC_DL,
                    	REA_EWM_AR_MRTG_AR_V.DATA_DT AS REA_EWM_AR_MRTG_AR_V_DATA_DT,
                    	REA_EWM_AR_MRTG_AR_V.VLD_FROM_TMS AS REA_EWM_AR_MRTG_AR_V_VLD_FROM_TMS,
                    	REA_EWM_AR_MRTG_AR_V.MSTR_SRC_STM_CD AS REA_EWM_AR_MRTG_AR_V_MSTR_SRC_STM_CD,
                    	REA_EWM_AR_MRTG_AR_V.MSTR_SRC_STM_KEY AS REA_EWM_AR_MRTG_AR_V_MSTR_SRC_STM_KEY,
                    	REA_EWM_AR_MRTG_AR_V.AR_ID AS REA_EWM_AR_MRTG_AR_V_AR_ID,
                    	REA_EWM_AR_MRTG_AR_V.FCY_AR_TP AS REA_EWM_AR_MRTG_AR_V_FCY_AR_TP
                FROM
                    {{ ref('rea_ewm_ar_mrtg_ar_v') }} AS REA_EWM_AR_MRTG_AR_V
            ) 
)

SELECT * FROM fnl_fcy_ar_tp

