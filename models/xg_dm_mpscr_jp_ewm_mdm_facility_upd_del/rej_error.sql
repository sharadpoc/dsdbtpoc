
{{config(
  materialized='ephemeral'
)}}

WITH rej_error AS (
SELECT
            		WRI_XFM_MDM_FCY_UPD.DUMMY AS DUMMY
        FROM
            {{ ref('ora_write_mdm_facility_upd') }} AS ORA_WRITE_MDM_FACILITY_UPD 
)

SELECT * FROM rej_error

