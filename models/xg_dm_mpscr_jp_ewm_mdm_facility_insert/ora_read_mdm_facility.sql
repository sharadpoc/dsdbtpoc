
{{config(
  materialized='ephemeral'
)}}

WITH ora_read_mdm_facility AS (
SELECT
            	FCY_ID,
            	SRC_ID,
            	DATE_FROM,
            	DATE_TO,
            	AR_ID,
            	SRC_DL,
            	FCY_RK,
            	FCY_AR_TP,
            	HIGHER_FCY_RK,
            	HIGHEST_FCY_RK,
            	LOWEST_LVL_IND,
            	SPSDG_FCY_RK,
            	COURT_CTRLD_WRKOUT_FILL_DT,
            	COURT_CTRLD_WRKOUT_FCY,
            	OUT_OF_COURT_WRKOUT_FCY,
            	SPSDG_FCY_DT,
            	COURT_CTRLD_WRKOUT_CLS_DT,
            	CR_OBLG_DFLTD,
            	FCY_VORTEX_ID,
            	DATE_FROM AS TGT_DATE_FROM
        FROM
            XG_PS_RDB_DM_MPSCR_DATABASE_XG_RDB_DM_SCHEMA_MPSCR_{{var('xg_pm_tgttbl_insert')}}
        WHERE
            SRC_DL='{{var("xg_pm_src_dl")}}'
            AND DEL_IN_SRC_STM_F=0
            AND DATE_FROM <= PARSE_TIMESTAMP(
                    '%Y%m%d%H%M%S',
                    "{{var('xg_pm_selection_date')}}{{var('xg_pm_business_tms')}}"
                )
            AND PARSE_TIMESTAMP(
                    '%Y%m%d%H%M%S',
                    "{{var('xg_pm_selection_date')}}{{var('xg_pm_business_tms')}}"
                ) < DATE_TO 
)

SELECT * FROM ora_read_mdm_facility

