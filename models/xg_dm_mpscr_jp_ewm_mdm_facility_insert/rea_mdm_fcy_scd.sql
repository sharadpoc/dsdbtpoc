
{{config(
  materialized='ephemeral'
)}}

WITH rea_mdm_fcy_scd AS (
SELECT
            	FCY_ID,
            	SRC_STM_ID,
            	DATA_DT,
            	AR_ID,
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
            	FCY_VORTEX_ID,
            	DATE_FROM
        FROM
            {{ ref('ora_read_ewm_mdm_stage_facility') }} AS ORA_READ_EWM_MDM_STAGE_FACILITY
        ORDER BY
            SRC_STM_ID ASC,
            FCY_ID ASC,
            AR_ID ASC,
            SRC_DL ASC,
            DATE_FROM ASC 
)

SELECT * FROM rea_mdm_fcy_scd

