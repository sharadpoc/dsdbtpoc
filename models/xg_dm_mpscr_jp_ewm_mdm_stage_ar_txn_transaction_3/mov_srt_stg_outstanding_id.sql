
{{config(
  materialized='ephemeral'
)}}

WITH mov_srt_stg_outstanding_id AS (
SELECT
    *
FROM
    (
        SELECT
            REA_EWM_MPS_TXN.SRC_DL AS SRC_DL,
            REA_EWM_MPS_TXN.AR_ID AS AR_ID,
            REA_EWM_MPS_TXN.VLD_FROM_TMS AS VLD_FROM_TMS,
            REA_EWM_MPS_TXN.DATA_DT AS DATA_DT,
            REA_EWM_MPS_TXN.SYS_INRT_TMS AS SYS_INRT_TMS,
            ROW_NUMBER() OVER(
                PARTITION BY AR_ID,
                VLD_FROM_TMS,
                SRC_DL
                ORDER BY
                    AR_ID ASC,
                    VLD_FROM_TMS ASC,
                    SRC_DL ASC
            ) AS RN
        FROM
            {{ ref('rea_ewm_mps_txn') }} AS REA_EWM_MPS_TXN
    ) t
WHERE
    RN = 1
)

SELECT * FROM mov_srt_stg_outstanding_id

