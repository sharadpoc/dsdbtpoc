
{{config(
  materialized='ephemeral'
)}}

WITH mov_rou_txn_transaction AS (
SELECT
    *
FROM
    (
        SELECT
            MOV_TXN_CONSOLIDATED.TXN_RK AS TXN_RK,
            MOV_TXN_CONSOLIDATED.TXN_FEE_CMPT_EV_ID AS TXN_FEE_CMPT_EV_ID,
            MOV_TXN_CONSOLIDATED.FCY_RK AS FCY_RK,
            MOV_TXN_CONSOLIDATED.TXN_EXN_EV_ID AS TXN_EXN_EV_ID,
            MOV_TXN_CONSOLIDATED.SRC_DL AS SRC_DL,
            MOV_TXN_CONSOLIDATED.EV_ID AS EV_ID,
            MOV_TXN_CONSOLIDATED.MSTR_SRC_STM_CD AS MSTR_SRC_STM_CD,
            MOV_TXN_CONSOLIDATED.MSTR_SRC_STM_KEY AS MSTR_SRC_STM_KEY,
            MOV_TXN_CONSOLIDATED.VLD_FROM_TMS AS VLD_FROM_TMS,
            MOV_TXN_CONSOLIDATED.VLD_TO_TMS AS VLD_TO_TMS,
            MOV_TXN_CONSOLIDATED.TXN_BOOK_DT AS TXN_BOOK_DT,
            MOV_TXN_CONSOLIDATED.TXN_CCY_AMT AS TXN_CCY_AMT,
            MOV_TXN_CONSOLIDATED.TXN_CCY_CL_CD AS TXN_CCY_CL_CD,
            MOV_TXN_CONSOLIDATED.TXN_RSN_TP_CL_CD AS TXN_RSN_TP_CL_CD,
            MOV_TXN_CONSOLIDATED.LDGR_CCY_AMT AS LDGR_CCY_AMT,
            MOV_TXN_CONSOLIDATED.LDGR_CCY_CL_CD AS LDGR_CCY_CL_CD,
            MOV_TXN_CONSOLIDATED.TXN_FEE_TXN_CCY_AMT AS TXN_FEE_TXN_CCY_AMT,
            MOV_TXN_CONSOLIDATED.TXN_FEE_CCY_CL_CD AS TXN_FEE_CCY_CL_CD,
            MOV_TXN_CONSOLIDATED.CL_CD AS CL_CD,
            MOV_TXN_CONSOLIDATED.SNDR_TO_RCVR_INF AS SNDR_TO_RCVR_INF,
            MOV_TXN_CONSOLIDATED.INT_TXN_CCY_AMT AS INT_TXN_CCY_AMT,
            MOV_TXN_CONSOLIDATED.PNP_TXN_CCY_AMT AS PNP_TXN_CCY_AMT,
            ROW_NUMBER() OVER(
                PARTITION BY SRC_DL,
                EV_ID,
                PRIM_AR_ID,
                MSTR_SRC_STM_KEY,
                FCY_RK
                ORDER BY
                    SRC_DL,
                    EV_ID,
                    PRIM_AR_ID,
                    MSTR_SRC_STM_KEY,
                    FCY_RK
            ) AS RN
        FROM
            {{ ref('mov_txn_consolidated') }} AS MOV_TXN_CONSOLIDATED
    ) t
WHERE
    RN = 1
)

SELECT * FROM mov_rou_txn_transaction

