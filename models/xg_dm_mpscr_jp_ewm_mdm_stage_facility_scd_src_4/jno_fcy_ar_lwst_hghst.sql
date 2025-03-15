
{{config(
  materialized='ephemeral'
)}}

WITH jno_fcy_ar_lwst_hghst AS (
SELECT
            		MOV_SRT_FCY_LWST_LVL.SPSDG_FCY_DT AS MOV_SRT_FCY_LWST_LVL_SPSDG_FCY_DT,
            	MOV_SRT_FCY_LWST_LVL.SPSDG_FCY_RK AS MOV_SRT_FCY_LWST_LVL_SPSDG_FCY_RK,
            	MOV_SRT_FCY_LWST_LVL.HLEAF AS MOV_SRT_FCY_LWST_LVL_HLEAF,
            	MOV_SRT_FCY_LWST_LVL.HIGHER_FCY_RK AS MOV_SRT_FCY_LWST_LVL_HIGHER_FCY_RK,
            	MOV_SRT_FCY_LWST_LVL.HIGHEST_FCY_RK AS MOV_SRT_FCY_LWST_LVL_HIGHEST_FCY_RK,
            	MOV_SRT_FCY_LWST_LVL.SRC_DL AS MOV_SRT_FCY_LWST_LVL_SRC_DL,
            	MOV_SRT_FCY_LWST_LVL.DATA_DT AS MOV_SRT_FCY_LWST_LVL_DATA_DT,
            	MOV_SRT_FCY_LWST_LVL.SYS_VLD_FROM_TMS AS MOV_SRT_FCY_LWST_LVL_SYS_VLD_FROM_TMS,
            	MOV_SRT_FCY_LWST_LVL.SYS_VLD_TO_TMS AS MOV_SRT_FCY_LWST_LVL_SYS_VLD_TO_TMS,
            	MOV_SRT_FCY_LWST_LVL.SRC_STM_ID AS MOV_SRT_FCY_LWST_LVL_SRC_STM_ID,
            	MOV_SRT_FCY_LWST_LVL.FCY_ID AS MOV_SRT_FCY_LWST_LVL_FCY_ID,
            	MOV_SRT_FCY_LWST_LVL.FCY_RK AS MOV_SRT_FCY_LWST_LVL_FCY_RK,
            	MOV_SRT_FCY_LWST_LVL.AR_ID AS MOV_SRT_FCY_LWST_LVL_AR_ID,
            	MOV_SRT_FCY_LWST_LVL.FCY_AR_TP AS MOV_SRT_FCY_LWST_LVL_FCY_AR_TP,
            	MOV_SRT_FCY_LWST_LVL.COURT_CTRLD_WRKOUT_FCY AS MOV_SRT_FCY_LWST_LVL_COURT_CTRLD_WRKOUT_FCY,
            	MOV_SRT_FCY_LWST_LVL.OUT_OF_COURT_WRKOUT_FCY AS MOV_SRT_FCY_LWST_LVL_OUT_OF_COURT_WRKOUT_FCY,
            	MOV_SRT_FCY_LWST_LVL.COURT_CTRLD_WRKOUT_FILL_DT AS MOV_SRT_FCY_LWST_LVL_COURT_CTRLD_WRKOUT_FILL_DT,
            	MOV_SRT_FCY_LWST_LVL.COURT_CTRLD_WRKOUT_CLS_DT AS MOV_SRT_FCY_LWST_LVL_COURT_CTRLD_WRKOUT_CLS_DT,
            	MOV_SRT_FCY_LWST_LVL.CR_OBLG_DFLTD AS MOV_SRT_FCY_LWST_LVL_CR_OBLG_DFLTD,
            	MOV_SRT_FCY_LWST_LVL.UNDRL_AR_ID AS MOV_SRT_FCY_LWST_LVL_UNDRL_AR_ID,
            	MOV_SRT_AR_X_R_HIGHEST.AR_ID AS MOV_SRT_AR_X_R_HIGHEST_AR_ID,
            	MOV_SRT_AR_X_R_HIGHEST.SRC_DL AS MOV_SRT_AR_X_R_HIGHEST_SRC_DL,
            	MOV_SRT_AR_X_R_HIGHEST.HIGHEST_FCY_IN_HRY AS MOV_SRT_AR_X_R_HIGHEST_HIGHEST_FCY_IN_HRY
        FROM
            {{ ref('mov_srt_fcy_lwst_lvl') }} AS MOV_SRT_FCY_LWST_LVL
            LEFT OUTER JOIN {{ ref('mov_srt_ar_x_r_highest') }} AS MOV_SRT_AR_X_R_HIGHEST ON MOV_SRT_AR_X_R_HIGHEST.SRC_DL=MOV_SRT_FCY_LWST_LVL.SRC_DL
            AND MOV_SRT_AR_X_R_HIGHEST.AR_ID=MOV_SRT_FCY_LWST_LVL.AR_ID 
)

SELECT * FROM jno_fcy_ar_lwst_hghst

