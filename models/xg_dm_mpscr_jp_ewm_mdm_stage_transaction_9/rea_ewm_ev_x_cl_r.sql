
{{config(
  materialized='ephemeral'
)}}

WITH rea_ewm_ev_x_cl_r AS (
SELECT
            	SRC_DL,
            	EV_ID,
            	CL_CD
        FROM
            {{ ref('ora_read_ewm_ev_x_cl_r') }} AS ORA_READ_EWM_EV_X_CL_R
        ORDER BY
            EV_ID ASC,
            SRC_DL ASC 
)

SELECT * FROM rea_ewm_ev_x_cl_r

