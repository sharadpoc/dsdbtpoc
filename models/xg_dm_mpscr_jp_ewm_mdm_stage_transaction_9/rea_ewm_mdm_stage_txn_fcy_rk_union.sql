
{{config(
  materialized='ephemeral'
)}}

WITH rea_ewm_mdm_stage_txn_fcy_rk_union AS (
SELECT
            	TXN_RK,
            	EV_ID,
            	MSTR_SRC_STM_CD,
            	MSTR_SRC_STM_KEY,
            	VLD_FROM_TMS,
            	VLD_TO_TMS,
            	PRIM_AR_ID,
            	FCY_RK,
            	TXN_BOOK_DT,
            	TXN_CCY_AMT,
            	TXN_CCY_CL_CD,
            	TXN_RSN_TP_CL_CD,
            	LDGR_CCY_AMT,
            	LDGR_CCY_CL_CD,
            	SRC_DL,
            	DATA_DT
        FROM
            {{ ref('ora_read_ewm_mdm_stage_txn_fcy_rk_union') }} AS ORA_READ_EWM_MDM_STAGE_TXN_FCY_RK_UNION
        ORDER BY
            EV_ID ASC,
            SRC_DL ASC 
)

SELECT * FROM rea_ewm_mdm_stage_txn_fcy_rk_union

