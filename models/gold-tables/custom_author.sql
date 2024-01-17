{{ config(materialized='table') }}
SELECT
    *
FROM
    {{ ref('authors_bank') }}
WHERE
    login = 'alexbonella'