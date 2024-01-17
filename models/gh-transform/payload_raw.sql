{{ config(materialized='table') }}

SELECT
    id as event_id,
    type as event_type,
    parse_json(payload):pull_request:base:repo:name::STRING AS repo_name,
    parse_json(payload):pull_request:base:repo:owner:organizations_url::STRING AS org_url,
    parse_json(payload):pull_request:base:repo:id::STRING AS repo_id,
    parse_json(payload):pull_request:base:id::STRING AS pull_req_id,
    parse_json(payload):pull_request:base:repo:watchers_count::INT AS watchers_count,
    parse_json(payload):pull_request:base:repo:forks_count::INT AS forks_count,
    parse_json(payload):pull_request:base:repo:language::STRING AS language,
    parse_json(payload):pull_request:base:repo:size::INT AS size
FROM
    {{ var('raw_data') }}