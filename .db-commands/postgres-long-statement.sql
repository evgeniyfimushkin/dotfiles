SELECT
    datname,
    pid,
    usename,
    application_name,
    client_addr,
    state,
    now() - query_start AS query_age,
    now() - xact_start AS transaction_age,
    wait_event_type,
    wait_event,
    left(query, 300) AS query
FROM pg_stat_activity
WHERE pid <> pg_backend_pid()
  AND state IN ('active', 'idle in transaction')
  AND COALESCE(query_start, xact_start) < now() - interval '30 seconds'
ORDER BY COALESCE(xact_start, query_start)
LIMIT 30;
