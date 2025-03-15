
{{config(
  materialized='ephemeral'
)}}

WITH ora_read_ewm_mdm_stage_txn_fcy_rk_master AS (
SELECT
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
            {{ source('DM_MPSCR', 'EWM_MDM_STAGE_TXN_FCY_RK_MASTER') }}
        WHERE
            SRC_DL='{{var("xg_pm_src_dl")}}'
            AND DATA_DT=PARSE_TIMESTAMP(
                    '%Y%m%d',
                    "{{var('xg_pm_selection_date')}}"
                ) 
)

SELECT * FROM ora_read_ewm_mdm_stage_txn_fcy_rk_master

