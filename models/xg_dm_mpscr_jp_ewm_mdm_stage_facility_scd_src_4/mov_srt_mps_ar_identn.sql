
{{config(
  materialized='ephemeral'
)}}

WITH mov_srt_mps_ar_identn AS (
SELECT
            		REA_EWM_AR_IDENTN_M.AR_ID AS AR_ID,
            	REA_EWM_AR_IDENTN_M.AR_IDENTN_NM AS AR_IDENTN_NM,
            	REA_EWM_AR_IDENTN_M.SRC_DL AS SRC_DL
        FROM
            {{ ref('rea_ewm_ar_identn_m') }} AS REA_EWM_AR_IDENTN_M
        ORDER BY
            SRC_DL ASC,
            AR_ID ASC 
)

SELECT * FROM mov_srt_mps_ar_identn

