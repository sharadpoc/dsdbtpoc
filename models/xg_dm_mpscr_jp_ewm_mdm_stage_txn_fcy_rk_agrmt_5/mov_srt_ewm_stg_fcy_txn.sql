
{{config(
  materialized='ephemeral'
)}}

WITH mov_srt_ewm_stg_fcy_txn AS (
SELECT
    *
FROM
    (
        SELECT
            REA_EWM_STG_TXN_FCY.SUBJ_AR_ID AS SUBJ_AR_ID,
            REA_EWM_STG_TXN_FCY.FCY_RK AS FCY_RK,
            REA_EWM_STG_TXN_FCY.DATA_DT AS DATA_DT,
            REA_EWM_STG_TXN_FCY.SRC_DL AS SRC_DL,
            ROW_NUMBER() OVER(
                PARTITION BY SRC_DL ASC,
                SUBJ_AR_ID ASC
                ORDER BY
                    SRC_DL ASC,
                    SUBJ_AR_ID ASC
            ) AS RN
        FROM
            {{ ref('rea_ewm_stg_txn_fcy') }} AS REA_EWM_STG_TXN_FCY
    ) t
WHERE
    RN = 1
)

SELECT * FROM mov_srt_ewm_stg_fcy_txn

