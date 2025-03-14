
{{config(
  materialized='ephemeral'
)}}

WITH rea_mdm_facility AS (
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
            	TGT_DATE_FROM
        FROM
            {{ ref('ora_read_mdm_facility') }} AS ORA_READ_MDM_FACILITY
        ORDER BY
            SRC_ID ASC,
            FCY_ID ASC,
            AR_ID ASC,
            SRC_DL ASC,
            DATE_FROM ASC 
)

SELECT * FROM rea_mdm_facility

