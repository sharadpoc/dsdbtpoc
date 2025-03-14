
{{config(
  materialized='ephemeral'
)}}

WITH rea_ewm_ev_txn_exn_v AS (
SELECT
            	EV_ID,
            	SNDR_TO_RCVR_INF,
            	SRC_DL,
            	INT_TXN_CCY_AMT,
            	PNP_TXN_CCY_AMT,
            	TXN_EXN_EV_ID
        FROM
            {{ ref('ora_read_ewm_ev_txn_exn_v') }} AS ORA_READ_EWM_EV_TXN_EXN_V
        ORDER BY
            EV_ID ASC,
            SRC_DL ASC 
)

SELECT * FROM rea_ewm_ev_txn_exn_v

