{{ config(materialized='table') }}
SELECT
    id as event_id,
    parse_json(actor):login::STRING AS login,
    parse_json(actor):avatar_url::STRING AS avatar_url,
    parse_json(actor):display_login::STRING AS display_login,
    parse_json(actor):id::STRING AS id,
    parse_json(actor):url::STRING AS url,
    type as event_type
FROM
    {{ var('raw_data') }}