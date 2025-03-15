
{{config(
  materialized='ephemeral'
)}}

WITH ora_read_ewm_stage_ar_txn_transaction_union AS (
SELECT
            	SRC_DL,
            	AR_ID,
            	VLD_FROM_TMS,
            	DATA_DT,
            	SYS_INRT_TMS
        FROM
            (
                    SELECT
                        			SRC_DL,
                        			AR_ID,
                        			VLD_FROM_TMS,
                        			DATA_DT,
                        			SYS_INRT_TMS
                    FROM
                        {{ source('DM_MPSCR', 'EWM_MDM_STAGE_AR_TRANSACTION') }}
                    WHERE
                        SRC_DL='{{var("xg_pm_src_dl")}}'
                        AND DATA_DT=PARSE_TIMESTAMP(
                                '%Y%m%d',
                                "{{var('xg_pm_selection_date')}}"
                            )
                    UNION DISTINCT
                    ALL
                    SELECT
                        			SRC_DL,
                        			AR_ID,
                        			VLD_FROM_TMS,
                        			DATA_DT,
                        			SYS_INRT_TMS
                    FROM
                        {{ source('DM_MPSCR', 'EWM_MDM_STAGE_TX_TRANSACTION') }}
                    WHERE
                        SRC_DL='{{var("xg_pm_src_dl")}}'
                        AND DATA_DT=PARSE_TIMESTAMP(
                                '%Y%m%d',
                                "{{var('xg_pm_selection_date')}}"
                            )
                ) 
)

SELECT * FROM ora_read_ewm_stage_ar_txn_transaction_union

