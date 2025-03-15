
{{config(
  materialized='ephemeral'
)}}

WITH mov_fcy_ar_identn AS (
SELECT
            		MOV_CY_AR_LWST_HGHST_SPSDG_FCY_DT AS SPSDG_FCY_DT,
            	MOV_CY_AR_LWST_HGHST_SPSDG_FCY_RK AS SPSDG_FCY_RK,
            	MOV_CY_AR_LWST_HGHST_HLEAF AS HLEAF,
            	MOV_CY_AR_LWST_HGHST_HIGHER_FCY_RK AS HIGHER_FCY_RK,
            	MOV_CY_AR_LWST_HGHST_HIGHEST_FCY_RK AS HIGHEST_FCY_RK,
            	MOV_SRT_MPS_AR_IDENTN_AR_IDENTN_NM AS AR_IDENTN_NM,
            	MOV_CY_AR_LWST_HGHST_HIGHEST_FCY_IN_HRY AS HIGHEST_FCY_IN_HRY,
            	MOV_CY_AR_LWST_HGHST_SRC_DL AS SRC_DL,
            	MOV_CY_AR_LWST_HGHST_DATA_DT AS DATA_DT,
            	MOV_CY_AR_LWST_HGHST_SYS_VLD_FROM_TMS AS SYS_VLD_FROM_TMS,
            	MOV_CY_AR_LWST_HGHST_SYS_VLD_TO_TMS AS SYS_VLD_TO_TMS,
            	MOV_CY_AR_LWST_HGHST_SRC_STM_ID AS SRC_STM_ID,
            	MOV_CY_AR_LWST_HGHST_FCY_ID AS FCY_ID,
            	MOV_CY_AR_LWST_HGHST_FCY_RK AS FCY_RK,
            	MOV_CY_AR_LWST_HGHST_FCY_AR_TP AS FCY_AR_TP,
            	MOV_CY_AR_LWST_HGHST_COURT_CTRLD_WRKOUT_FCY AS COURT_CTRLD_WRKOUT_FCY,
            	MOV_CY_AR_LWST_HGHST_OUT_OF_COURT_WRKOUT_FCY AS OUT_OF_COURT_WRKOUT_FCY,
            	MOV_CY_AR_LWST_HGHST_COURT_CTRLD_WRKOUT_FILL_DT AS COURT_CTRLD_WRKOUT_FILL_DT,
            	MOV_CY_AR_LWST_HGHST_COURT_CTRLD_WRKOUT_CLS_DT AS COURT_CTRLD_WRKOUT_CLS_DT,
            	MOV_CY_AR_LWST_HGHST_CR_OBLG_DFLTD AS CR_OBLG_DFLTD,
            	MOV_CY_AR_LWST_HGHST_UNDRL_AR_ID AS UNDRL_AR_ID
        FROM
            {{ ref('jno_fcy_ar_identn') }} AS JNO_FCY_AR_IDENTN 
)

SELECT * FROM mov_fcy_ar_identn

