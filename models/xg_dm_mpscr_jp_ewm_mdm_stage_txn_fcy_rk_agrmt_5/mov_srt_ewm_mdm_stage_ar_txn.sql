
{{config(
  materialized='ephemeral'
)}}

WITH mov_srt_ewm_mdm_stage_ar_txn AS (
SELECT
    *
FROM
    (
        SELECT
            REA_EWM_MDM_STAGE_AR_TXN.SRC_DL AS SRC_DL,
            REA_EWM_MDM_STAGE_AR_TXN.OBJ_AR_ID AS OBJ_AR_ID,
            REA_EWM_MDM_STAGE_AR_TXN.PRIM_AR_ID AS PRIM_AR_ID,
            REA_EWM_MDM_STAGE_AR_TXN.AR_ID AS AR_ID,
            ROW_NUMBER() OVER(
                PARTITION BY SRC_DL ASC,
                PRIM_AR_ID ASC
                ORDER BY
                    SRC_DL ASC,
                    PRIM_AR_ID ASC
            ) AS RN
        FROM
            {{ ref('rea_ewm_mdm_stage_ar_txn') }} AS REA_EWM_MDM_STAGE_AR_TXN
    ) t
WHERE
    RN = 1
)

SELECT * FROM mov_srt_ewm_mdm_stage_ar_txn

