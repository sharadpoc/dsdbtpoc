
{{config(
  materialized='ephemeral'
)}}

WITH mov_srt_spsdg_ar AS (
SELECT
            		MOV_AR_X_RLTNP_HGR.SPSDG_FCY_DT AS SPSDG_FCY_DT,
            	MOV_AR_X_RLTNP_HGR.SRC_DL AS SRC_DL,
            	MOV_AR_X_RLTNP_HGR.OBJ_AR_ID AS AR_ID,
            	MOV_AR_X_RLTNP_HGR.SUBJ_AR_ID AS SUBJ_AR_ID
        FROM
            {{ ref('mov_ar_x_rltnp_hgr') }} AS MOV_AR_X_RLTNP_HGR
        ORDER BY
            SRC_DL ASC,
            OBJ_AR_ID ASC 
)

SELECT * FROM mov_srt_spsdg_ar

