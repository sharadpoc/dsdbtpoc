
{{config(
  materialized='ephemeral'
)}}

WITH mov_srt_mps_ar_identn AS (
SELECT
    *
FROM
    (
        SELECT
            REA_EWM_AR_IDENTN_M.AR_ID AS AR_ID,
            REA_EWM_AR_IDENTN_M.AR_IDENTN_NM AS AR_IDENTN_NM,
            REA_EWM_AR_IDENTN_M.SRC_DL AS SRC_DL,
            ROW_NUMBER() OVER(
                PARTITION BY SRC_DL ASC,
                AR_ID ASC
                ORDER BY
                    SRC_DL ASC,
                    AR_ID ASC
            ) AS RN
        FROM
            {{ ref('rea_ewm_ar_identn_m') }} AS REA_EWM_AR_IDENTN_M
    ) t
WHERE
    RN = 1
)

SELECT * FROM mov_srt_mps_ar_identn

