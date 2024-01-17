{{ config(materialized='table') }}
SELECT
    *
FROM
    {{ ref('payload_raw') }}
WHERE 
    LANGUAGE IS NOT NULL