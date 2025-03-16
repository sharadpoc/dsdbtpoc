
{{config(
  materialized='ephemeral'
)}}

WITH mov_srt_ewm_ar_mstr_cr_ar_v AS (
SELECT
    *
FROM
    (
        SELECT
            REA_EWM_AR_MSTR_CR_AR_V.PRIM_AR_ID AS PRIM_AR_ID,
            REA_EWM_AR_MSTR_CR_AR_V.SRC_DL AS SRC_DL,
            REA_EWM_AR_MSTR_CR_AR_V.SUBJ_AR_ID AS SUBJ_AR_ID,
            ROW_NUMBER() OVER(
                PARTITION BY SRC_DL ASC,
                PRIM_AR_ID ASC
                ORDER BY
                    SRC_DL ASC,
                    PRIM_AR_ID ASC
            ) AS RN
        FROM
            {{ ref('rea_ewm_ar_mstr_cr_ar_v') }} AS REA_EWM_AR_MSTR_CR_AR_V
    ) t
WHERE
    RN = 1
)

SELECT * FROM mov_srt_ewm_ar_mstr_cr_ar_v

