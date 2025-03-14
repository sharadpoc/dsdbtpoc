
{{config(
  materialized='ephemeral'
)}}

WITH ora_read_ewm_ar_x_ar_r_hgr AS (
SELECT
            DISTINCT 	SRC_DL,
            	FCY_ID,
            	HIGHER_FCY_ID,
            	HIGHEST_FCY_ID,
            	LEAF
        FROM
            {{ ref('_ora_read_ewm_ar_x_ar_r_hgr_2') }} A
        WHERE
            RANK=1 
)

SELECT * FROM ora_read_ewm_ar_x_ar_r_hgr

