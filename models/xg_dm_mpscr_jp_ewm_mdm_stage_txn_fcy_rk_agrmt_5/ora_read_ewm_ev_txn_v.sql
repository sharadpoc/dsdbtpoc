
{{config(
  materialized='ephemeral'
)}}

WITH ora_read_ewm_ev_txn_v AS (
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
            {{ source('DM_MPSCR', 'EWM_EV_TXN_V') }}
        WHERE
            SRC_DL='{{var("xg_pm_src_dl")}}'
            AND TXN_RSN_TP_CL_CD IN(
                    'FEE_CMSN_PYMT',
                    'INT_PYMT',
                    'PNP_PYMT',
                    'PST_RSL_PYMT',
                    'TCNQL_PYMT',
                    'FNC_SVC_PYMT',
                    'ADL_WRKOUT_COST',
                    'ADMIN_RCVR_COST',
                    'EXT_COST',
                    'FEE_CMSN_CHRG',
                    'INT_CHRG',
                    'LGL_COST',
                    'LQD_COST',
                    'PST_RSL_COST',
                    'TCNQL_ADVNC_PYMT',
                    'PNP_ADVNC',
                    'FNC_SVC_CHRG',
                    'WRT_OFF',
                    'FNC_CLM',
                    'AGRM_NET_SALE'
                )
            AND VLD_FROM_TMS <= PARSE_TIMESTAMP(
                    '%Y%m%d%H%M%S',
                    "{{var('xg_pm_selection_date')}}{{var('xg_pm_business_tms')}}"
                )
            AND PARSE_TIMESTAMP(
                    '%Y%m%d%H%M%S',
                    "{{var('xg_pm_selection_date')}}{{var('xg_pm_business_tms')}}"
                ) < VLD_TO_TMS 
)

SELECT * FROM ora_read_ewm_ev_txn_v

