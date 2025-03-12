
{{config(
  materialized='ephemeral'
)}}

WITH ora_read_mdm_credit_risk_rating AS (
SELECT
            		CR_RSK_RTG_ID,
            	DATE_FROM,
            	DATE_TO,
            	SRC_ID,
            	INR_CR_RTG,
            	CR_RSK_RTG_DT,
            	INR_RTG_MDL,
            	CST_RTG_ST,
            	SRC_DL,
            	DATE_FROM AS tgt_date_from
        FROM
            {{ source('xg_ps_rdb_dm_mpscr_database.xg_rdb_dm_schema_mpscr', 'mdm_credit_risk_rating') }}
        WHERE
            SRC_DL='{{var("xg_pm_src_dl")}}'
            AND DATE_FROM <= PARSE_TIMESTAMP( 
                '%Y%m%d%H%M%S', 
                "{{var('xg_pm_selection_date')}}{{var('xg_pm_business_tms')}}"
                )
            AND PARSE_TIMESTAMP(
                    '%Y%m%d%H%M%S',
                    "{{var('xg_pm_selection_date')}}{{var('xg_pm_business_tms')}}"
                ) < DATE_TO
            AND DEL_IN_SRC_STM_F=0 
)

SELECT * FROM ora_read_mdm_credit_risk_rating

