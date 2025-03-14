
{{config(
  materialized='ephemeral'
)}}

WITH ora_read_ewm_txn AS (
SELECT
            	SRC_DL,
            	AR_ID,
            	VLD_FROM_TMS
        FROM
            (
                    SELECT
                        			SRC_DL,
                        			AR_ID,
                        			VLD_FROM_TMS
                    FROM
                        {{ source('DM_MPSCR', 'EWM_AR_FWD_TXN_V') }}
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
                    UNION DISTINCT
                    ALL
                    SELECT
                        			SRC_DL,
                        			AR_ID,
                        			VLD_FROM_TMS
                    FROM
                        {{ source('DM_MPSCR', 'EWM_AR_FX_TXN_V') }}
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
                    UNION DISTINCT
                    ALL
                    SELECT
                        			SRC_DL,
                        			AR_ID,
                        			VLD_FROM_TMS
                    FROM
                        {{ source('DM_MPSCR', 'EWM_AR_OPT_TXN_V') }}
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
                    UNION DISTINCT
                    ALL
                    SELECT
                        			SRC_DL,
                        			AR_ID,
                        			VLD_FROM_TMS
                    FROM
                        {{ source('DM_MPSCR', 'EWM_AR_RPRCH_AGRM_TXN_V') }}
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
                    UNION DISTINCT
                    ALL
                    SELECT
                        			SRC_DL,
                        			AR_ID,
                        			VLD_FROM_TMS
                    FROM
                        {{ source('DM_MPSCR', 'EWM_AR_SCR_TRD_TXN_V') }}
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
                    UNION DISTINCT
                    ALL
                    SELECT
                        			SRC_DL,
                        			AR_ID,
                        			VLD_FROM_TMS
                    FROM
                        {{ source('DM_MPSCR', 'EWM_AR_SWAP_TXN_V') }}
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
)

SELECT * FROM ora_read_ewm_txn

