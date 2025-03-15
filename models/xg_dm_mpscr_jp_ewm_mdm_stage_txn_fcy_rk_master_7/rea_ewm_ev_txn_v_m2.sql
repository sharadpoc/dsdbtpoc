
{{config(
  materialized='ephemeral'
)}}

WITH rea_ewm_ev_txn_v_m2 AS (
SELECT
            	SRC_DL,
            	EV_ID,
            	MSTR_SRC_STM_CD,
            	MSTR_SRC_STM_KEY,
            	VLD_FROM_TMS,
            	VLD_TO_TMS,
            	PRIM_AR_ID,
            	TXN_BOOK_DT,
            	TXN_CCY_AMT,
            	TXN_CCY_CL_CD,
            	TXN_RSN_TP_CL_CD,
            	LDGR_CCY_AMT,
            	LDGR_CCY_CL_CD
        FROM
            {{ ref('ora_read_ewm_ev_txn_v_m2') }} AS ORA_READ_EWM_EV_TXN_V
        ORDER BY
            SRC_DL ASC,
            PRIM_AR_ID ASC 
)

SELECT * FROM rea_ewm_ev_txn_v_m2

