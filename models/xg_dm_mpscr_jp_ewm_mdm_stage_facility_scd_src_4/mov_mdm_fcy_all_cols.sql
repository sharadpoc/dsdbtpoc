{{ config(materialized='table') }}


WITH mov_mdm_fcy_all_cols AS (
SELECT
  mov_FCY_AR_IDENTN.DATA_DT AS DATA_DT,
  mov_FCY_AR_IDENTN.FCY_ID AS FCY_ID,
  mov_FCY_AR_IDENTN.SRC_STM_ID AS SRC_STM_ID,
  mov_FCY_AR_IDENTN.SYS_VLD_FROM_TMS AS DATE_FROM,
  mov_FCY_AR_IDENTN.UNDRL_AR_ID AS AR_ID,
  mov_FCY_AR_IDENTN.SYS_VLD_TO_TMS AS DATE_TO,
  mov_FCY_AR_IDENTN.SRC_DL AS SRC_DL,
  mov_FCY_AR_IDENTN.FCY_RK AS FCY_RK,
  mov_FCY_AR_IDENTN.FCY_AR_TP AS FCY_AR_TP,

  {#-- Use Jinja to decide how to derive HIGHER_FCY_RK --#}
  {% if var('use_ifnull_higher_fcy_rk', True) %}
    IFNULL(mov_FCY_AR_IDENTN.HIGHER_FCY_RK, mov_FCY_AR_IDENTN.FCY_RK) AS HIGHER_FCY_RK,
  {% else %}
    mov_FCY_AR_IDENTN.HIGHER_FCY_RK AS HIGHER_FCY_RK,
  {% endif %}

  {#-- Use Jinja to decide how to derive HIGHEST_FCY_RK --#}
  {% if var('use_ifnull_highest_fcy_rk', True) %}
    IFNULL(mov_FCY_AR_IDENTN.HIGHEST_FCY_RK, mov_FCY_AR_IDENTN.FCY_RK) AS HIGHEST_FCY_RK,
  {% else %}
    mov_FCY_AR_IDENTN.HIGHEST_FCY_RK AS HIGHEST_FCY_RK,
  {% endif %}

  {#-- For LOWEST_LVL_IND, we use BigQuery’s nested IF() functions to mimic the Oracle IF/THEN/ELSE logic --#}
  IF(mov_FCY_AR_IDENTN.HLEAF = 1, 'Y',
     IF(mov_FCY_AR_IDENTN.HLEAF = 0, 'N',
        IF(mov_FCY_AR_IDENTN.HIGHEST_FCY_IN_HRY = "Y", 'N', 'Y')
     )
  ) AS LOWEST_LVL_IND,

  mov_FCY_AR_IDENTN.SPSDG_FCY_RK AS SPSDG_FCY_RK,
  mov_FCY_AR_IDENTN.COURT_CTRLD_WRKOUT_FILL_DT AS COURT_CTRLD_WRKOUT_FILL_DT,
  mov_FCY_AR_IDENTN.COURT_CTRLD_WRKOUT_FCY AS COURT_CTRLD_WRKOUT_FCY,
  mov_FCY_AR_IDENTN.OUT_OF_COURT_WRKOUT_FCY AS OUT_OF_COURT_WRKOUT_FCY,
  mov_FCY_AR_IDENTN.SPSDG_FCY_DT AS SPSDG_FCY_DT,
  mov_FCY_AR_IDENTN.COURT_CTRLD_WRKOUT_CLS_DT AS COURT_CTRLD_WRKOUT_CLS_DT,
  mov_FCY_AR_IDENTN.CR_OBLG_DFLTD AS CR_OBLG_DFLTD,
  mov_FCY_AR_IDENTN.AR_IDENTN_NM AS FCY_VORTEX_ID,
   TIMESTAMP('{{ run_started_at }}')  AS SYS_INRT_TMS

FROM {{ ref('mov_fcy_ar_identn') }}  as mov_FCY_AR_IDENTN
)

select * from mov_mdm_fcy_all_cols