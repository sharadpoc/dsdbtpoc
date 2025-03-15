
{{config(
  materialized='ephemeral'
)}}

WITH ora_read_ewm_ar AS (
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
                        {{ source('DM_MPSCR', 'EWM_AR_DEP_AR_V') }}
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
                        {{ source('DM_MPSCR', 'EWM_AR_LOAN_AR_V') }}
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
                        {{ source('DM_MPSCR', 'EWM_AR_LOC_AR_V') }}
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
                        {{ source('DM_MPSCR', 'EWM_AR_LSE_AR_V') }}
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
                        {{ source('DM_MPSCR', 'EWM_AR_LTR_OF_GNT_AR_V') }}
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
                        {{ source('DM_MPSCR', 'EWM_AR_LTROC_AR_V') }}
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
                        {{ source('DM_MPSCR', 'EWM_AR_MRTG_AR_V') }}
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
                        {{ source('DM_MPSCR', 'EWM_AR_RCVB_FNC_AR_V') }}
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

SELECT * FROM ora_read_ewm_ar

