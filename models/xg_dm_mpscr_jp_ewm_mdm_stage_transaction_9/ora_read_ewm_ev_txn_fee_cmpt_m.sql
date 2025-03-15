
{{config(
  materialized='ephemeral'
)}}

WITH ora_read_ewm_ev_txn_fee_cmpt_m AS (
SELECT
            	SRC_DL,
            	EV_ID,
            	TXN_FEE_TXN_CCY_AMT,
            	TXN_CCY_CL_CD AS TXN_FEE_CCY_CL_CD,
            	EV_ID AS TXN_FEE_CMPT_EV_ID
        FROM
            {{ source('DM_MPSCR', 'EWM_EV_TXN_FEE_CMPT_M') }}
        WHERE
            SRC_DL='{{var("xg_pm_src_dl")}}'
            AND VLD_FROM_TMS <= PARSE_TIMESTAMP(
                    '%Y%m%d%H%M%S',
                    "{{var('xg_pm_selection_date')}}{{var('xg_pm_business_tms')}}"
                )
            AND PARSE_TIMESTAMP(
                    '%Y%m%d%H%M%S',
                    "{{var('xg_pm_selection_date')}}{{var('xg_pm_business_tms')}}"
                ) < VLD_TO_TMS 
)

SELECT * FROM ora_read_ewm_ev_txn_fee_cmpt_m

