
{{config(
  materialized='ephemeral'
)}}

WITH mov_srt_ewm_stg_fcy_txn_m1 AS (
SELECT
    *
FROM
    (
        SELECT
            REA_EWM_STG_TXN_FCY.PRIM_AR_ID AS PRIM_AR_ID,
            REA_EWM_STG_TXN_FCY.FCY_RK AS FCY_RK,
            REA_EWM_STG_TXN_FCY.DATA_DT AS DATA_DT,
            REA_EWM_STG_TXN_FCY.SRC_DL AS SRC_DL,
            ROW_NUMBER() OVER(
                PARTITION BY SRC_DL ASC,
                PRIM_AR_ID ASC
                ORDER BY
                    SRC_DL ASC,
                    PRIM_AR_ID ASC
            ) AS RN
        FROM
            {{ ref('rea_ewm_stg_txn_fcy_m1') }} AS REA_EWM_STG_TXN_FCY
    ) t
WHERE
    RN = 1
)

SELECT * FROM mov_srt_ewm_stg_fcy_txn_m1

