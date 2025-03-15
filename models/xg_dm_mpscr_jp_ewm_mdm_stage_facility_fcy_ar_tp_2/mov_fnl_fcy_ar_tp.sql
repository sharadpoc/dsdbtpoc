
{{config(
  materialized='ephemeral'
)}}

WITH mov_fnl_fcy_ar_tp AS (
SELECT
            		REA_EWM_AR_DEP_AR_V_AR_ID AS AR_ID,
            	REA_EWM_AR_DEP_AR_V_FCY_AR_TP AS FCY_AR_TP,
            	SRC_DL AS SRC_DL,
            	DATA_DT AS DATA_DT,
            	VLD_FROM_TMS AS VLD_FROM_TMS,
            	MSTR_SRC_STM_CD AS MSTR_SRC_STM_CD,
            	MSTR_SRC_STM_KEY AS MSTR_SRC_STM_KEY
        FROM
            {{ ref('fnl_fcy_ar_tp') }} AS FNL_FCY_AR_TP 
)

SELECT * FROM mov_fnl_fcy_ar_tp

