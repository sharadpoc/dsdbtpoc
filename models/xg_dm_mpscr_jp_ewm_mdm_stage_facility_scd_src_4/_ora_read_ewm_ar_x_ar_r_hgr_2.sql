{{ config(materialized='table') }}


{% set recursive_keyword = "RECURSIVE" %}

WITH {{ recursive_keyword }} hierarchy AS (
  -- Anchor: treat every row in the source as a starting point
  SELECT 
    SRC_DL,
    SUBJ_AR_ID AS HIGHER_FCY_ID,
    VLD_FROM_TMS,
    MSTR_SRC_STM_CD AS SRC_STM_ID,
    OBJ_AR_ID AS FCY_ID,
    SUBJ_AR_ID AS HIGHEST_FCY_ID,
    1 AS lvl,
    ARRAY[OBJ_AR_ID] AS path
  FROM {{ ref('_ora_read_ewm_ar_x_ar_r_hgr_1') }}
  
  UNION ALL
  
  -- Recursive part: join child rows using the condition child.SUBJ_AR_ID = parent.FCY_ID
  SELECT 
    child.SRC_DL,
    child.SUBJ_AR_ID AS HIGHER_FCY_ID,
    child.VLD_FROM_TMS,
    child.MSTR_SRC_STM_CD AS SRC_STM_ID,
    child.OBJ_AR_ID AS FCY_ID,
    parent.HIGHEST_FCY_ID,
    parent.lvl + 1 AS lvl,
    ARRAY_CONCAT(parent.path, [child.OBJ_AR_ID]) AS path
  FROM hierarchy AS parent
  JOIN {{ ref('_ora_read_ewm_ar_x_ar_r_hgr_1') }} AS child
    ON child.SUBJ_AR_ID = parent.FCY_ID
  -- Prevent cycles by ensuring the child’s OBJ_AR_ID is not already in the path
  WHERE NOT child.OBJ_AR_ID IN UNNEST(parent.path)
)

, hierarchy_with_leaf AS (
  SELECT 
    h.*,
    -- In Oracle, CONNECT_BY_ISLEAF is true if no child exists;
    -- here we test if any row in the source qualifies as a child.
    CASE 
      WHEN EXISTS (
        SELECT 1 
        FROM {{ ref('_ora_read_ewm_ar_x_ar_r_hgr_1') }} AS c
        WHERE c.SUBJ_AR_ID = h.FCY_ID
      ) THEN 0
      ELSE 1
    END AS LEAF
  FROM hierarchy AS h
)

SELECT
  SRC_DL,
  HIGHER_FCY_ID,
  VLD_FROM_TMS,
  SRC_STM_ID,
  FCY_ID,
  HIGHEST_FCY_ID,
  LEAF,
  -- Replicate the Oracle RANK() over (partition ... order by LEVEL DESC)
  RANK() OVER (
    PARTITION BY SRC_STM_ID, FCY_ID, VLD_FROM_TMS 
    ORDER BY lvl DESC
  ) AS RANK
FROM hierarchy_with_leaf


