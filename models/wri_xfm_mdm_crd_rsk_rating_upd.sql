
{{config(
  materialized='ephemeral'
)}}

WITH wri_xfm_mdm_crd_rsk_rating_upd AS (
SELECT
            	DUMMY
        FROM
            {{ ref('rwg_dummy') }} AS RWG_DUMMY 
)

SELECT * FROM wri_xfm_mdm_crd_rsk_rating_upd

