
{{config(
  materialized='ephemeral'
)}}

WITH ora_read_ewm_mdm_stage_facility AS (
SELECT
            	FCY_ID,
            	SRC_STM_ID,
            	DATA_DT,
            	AR_ID,
            	DATE_FROM,
            	DATE_TO,
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
            	FCY_VORTEX_ID
        FROM
            {{ source('DM_MPSCR', 'EWM_MDM_STAGE_FACILITY') }}
        WHERE
            DATA_DT=PARSE_TIMESTAMP(
                    '%Y%m%d',
                    "{{var('xg_pm_selection_date')}}"
                )
            AND SRC_DL='{{var("xg_pm_src_dl")}}' 
)

SELECT * FROM ora_read_ewm_mdm_stage_facility

