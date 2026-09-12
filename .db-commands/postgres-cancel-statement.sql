# отмена запроса, соединение сохраняется
# 12345 — pid
SELECT pg_cancel_backend(12345);

# отмена запросы с разрывом соединения
SELECT pg_terminate_backend(12345);
