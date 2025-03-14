
{{config(
  materialized='ephemeral'
)}}

WITH ora_read_ewm_ev_txn_exn_v AS (
SELECT
            	EV_ID,
            	SNDR_TO_RCVR_INF,
            	SRC_DL,
            	INT_TXN_CCY_AMT,
            	PNP_TXN_CCY_AMT,
            	EV_ID AS TXN_EXN_EV_ID
        FROM
            {{ source('DM_MPSCR', 'EWM_EV_TXN_EXN_V') }}
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

SELECT * FROM ora_read_ewm_ev_txn_exn_v

