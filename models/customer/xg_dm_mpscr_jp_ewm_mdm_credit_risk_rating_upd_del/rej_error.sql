
{{config(
  materialized='ephemeral'
)}}

WITH rej_error AS (
SELECT
            		wri_XFM_MDM_CRD_RSK_RATING_UPD.DUMMY AS dummy
        FROM
            ora_write_mdm_crd_resk_rating_upd AS ORA_write_MDM_CRD_RESK_RATING_UPD 
)

SELECT * FROM rej_error

