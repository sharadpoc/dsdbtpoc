
{{config(
  materialized='ephemeral'
)}}

WITH rea_ewm_ev_txn_fee_cmpt_m AS (
SELECT
            	SRC_DL,
            	EV_ID,
            	TXN_FEE_TXN_CCY_AMT,
            	TXN_FEE_CCY_CL_CD,
            	TXN_FEE_CMPT_EV_ID
        FROM
            {{ ref('ora_read_ewm_ev_txn_fee_cmpt_m') }} AS ORA_READ_EWM_EV_TXN_FEE_CMPT_M
        ORDER BY
            EV_ID ASC,
            SRC_DL ASC 
)

SELECT * FROM rea_ewm_ev_txn_fee_cmpt_m

