
{{config(
  materialized='ephemeral'
)}}

WITH mov_cy_ar_lwst_hghst AS (
SELECT
            		MOV_SRT_FCY_LWST_LVL_SPSDG_FCY_DT AS SPSDG_FCY_DT,
            	MOV_SRT_FCY_LWST_LVL_SPSDG_FCY_RK AS SPSDG_FCY_RK,
            	MOV_SRT_FCY_LWST_LVL_HLEAF AS HLEAF,
            	MOV_SRT_FCY_LWST_LVL_HIGHER_FCY_RK AS HIGHER_FCY_RK,
            	MOV_SRT_FCY_LWST_LVL_HIGHEST_FCY_RK AS HIGHEST_FCY_RK,
            	MOV_SRT_AR_X_R_HIGHEST_HIGHEST_FCY_IN_HRY AS HIGHEST_FCY_IN_HRY,
            	MOV_SRT_FCY_LWST_LVL_SRC_DL AS SRC_DL,
            	MOV_SRT_FCY_LWST_LVL_DATA_DT AS DATA_DT,
            	MOV_SRT_FCY_LWST_LVL_SYS_VLD_FROM_TMS AS SYS_VLD_FROM_TMS,
            	MOV_SRT_FCY_LWST_LVL_SYS_VLD_TO_TMS AS SYS_VLD_TO_TMS,
            	MOV_SRT_FCY_LWST_LVL_SRC_STM_ID AS SRC_STM_ID,
            	MOV_SRT_FCY_LWST_LVL_FCY_ID AS FCY_ID,
            	MOV_SRT_FCY_LWST_LVL_FCY_RK AS FCY_RK,
            	MOV_SRT_FCY_LWST_LVL_AR_ID AS AR_ID,
            	MOV_SRT_FCY_LWST_LVL_FCY_AR_TP AS FCY_AR_TP,
            	MOV_SRT_FCY_LWST_LVL_COURT_CTRLD_WRKOUT_FCY AS COURT_CTRLD_WRKOUT_FCY,
            	MOV_SRT_FCY_LWST_LVL_OUT_OF_COURT_WRKOUT_FCY AS OUT_OF_COURT_WRKOUT_FCY,
            	MOV_SRT_FCY_LWST_LVL_COURT_CTRLD_WRKOUT_FILL_DT AS COURT_CTRLD_WRKOUT_FILL_DT,
            	MOV_SRT_FCY_LWST_LVL_COURT_CTRLD_WRKOUT_CLS_DT AS COURT_CTRLD_WRKOUT_CLS_DT,
            	MOV_SRT_FCY_LWST_LVL_CR_OBLG_DFLTD AS CR_OBLG_DFLTD,
            	MOV_SRT_FCY_LWST_LVL_UNDRL_AR_ID AS UNDRL_AR_ID
        FROM
            {{ ref('jno_fcy_ar_lwst_hghst') }} AS JNO_FCY_AR_LWST_HGHST 
)

SELECT * FROM mov_cy_ar_lwst_hghst

