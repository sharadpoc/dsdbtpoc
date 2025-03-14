
{{config(
  materialized='ephemeral'
)}}

WITH rea_ewm_ar_x_cl_fnc_st_r AS (
SELECT
            	SRC_DL,
            	AR_ID,
            	AR_CL_CD
        FROM
            {{ ref('ora_read_ewm_ar_x_cl_fnc_st_r') }} AS ORA_READ_EWM_AR_X_CL_FNC_ST_R
        ORDER BY
            SRC_DL ASC,
            AR_ID ASC 
)

SELECT * FROM rea_ewm_ar_x_cl_fnc_st_r

