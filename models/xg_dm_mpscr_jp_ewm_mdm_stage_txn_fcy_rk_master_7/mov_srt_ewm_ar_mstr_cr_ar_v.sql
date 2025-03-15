
{{config(
  materialized='ephemeral'
)}}

WITH mov_srt_ewm_ar_mstr_cr_ar_v AS (
SELECT
            		REA_EWM_AR_MSTR_CR_AR_V.PRIM_AR_ID AS PRIM_AR_ID,
            	REA_EWM_AR_MSTR_CR_AR_V.SRC_DL AS SRC_DL,
            	REA_EWM_AR_MSTR_CR_AR_V.SUBJ_AR_ID AS SUBJ_AR_ID
        FROM
            {{ ref('rea_ewm_ar_mstr_cr_ar_v') }} AS REA_EWM_AR_MSTR_CR_AR_V
        ORDER BY
            SRC_DL ASC,
            PRIM_AR_ID ASC 
)

SELECT * FROM mov_srt_ewm_ar_mstr_cr_ar_v

