
{{config(
  materialized='ephemeral'
)}}

WITH mov_fnl_txn_fcy_rk AS (
SELECT
            		EV_ID AS EV_ID,
            	MSTR_SRC_STM_CD AS MSTR_SRC_STM_CD,
            	MSTR_SRC_STM_KEY AS MSTR_SRC_STM_KEY,
            	VLD_FROM_TMS AS VLD_FROM_TMS,
            	VLD_TO_TMS AS VLD_TO_TMS,
            	PRIM_AR_ID AS PRIM_AR_ID,
            	FCY_RK AS FCY_RK,
            	TXN_BOOK_DT AS TXN_BOOK_DT,
            	TXN_CCY_AMT AS TXN_CCY_AMT,
            	TXN_CCY_CL_CD AS TXN_CCY_CL_CD,
            	TXN_RSN_TP_CL_CD AS TXN_RSN_TP_CL_CD,
            	LDGR_CCY_AMT AS LDGR_CCY_AMT,
            	LDGR_CCY_CL_CD AS LDGR_CCY_CL_CD,
            	SRC_DL AS SRC_DL,
            	DATA_DT AS DATA_DT
        FROM
            {{ ref('fnl_txn_fcy_rk') }} AS FNL_TXN_FCY_RK 
)

SELECT * FROM mov_fnl_txn_fcy_rk

