
{{config(
  materialized='ephemeral'
)}}

WITH mov_ar_rltnp AS (
SELECT
            		MOV_FLT_AR_X_AR.SUBJ_AR_ID AS AR_ID,
            	MOV_FLT_AR_X_AR.SRC_DL AS SRC_DL,
            	MOV_FLT_AR_X_AR.OBJ_AR_ID AS OBJ_AR_ID,
            	MOV_FLT_AR_X_AR.SUBJ_AR_ID AS SUBJ_AR_ID,
            	MOV_FLT_AR_X_AR.AR_X_AR_RLTNP_TP_CL_CD AS AR_X_AR_RLTNP_TP_CL_CD
        FROM
            {{ ref('mov_flt_ar_x_ar') }} AS MOV_FLT_AR_X_AR 
)

SELECT * FROM mov_ar_rltnp

