
{{config(
  materialized='ephemeral'
)}}

WITH rea_ewm_ar_scr_trd_txn_v AS (
SELECT
            	SRC_DL,
            	DATA_DT,
            	VLD_FROM_TMS,
            	MSTR_SRC_STM_CD,
            	MSTR_SRC_STM_KEY,
            	AR_ID,
            	FCY_AR_TP
        FROM
            {{ ref('ora_read_ewm_ar_scr_trd_txn_v') }} AS ORA_READ_EWM_AR_SCR_TRD_TXN_V 
)

SELECT * FROM rea_ewm_ar_scr_trd_txn_v

