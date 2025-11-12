--------------------------------------------------------------------------------
-- Script: ash_top_sql.sql
-- Descrição: Top SQL recentes usando v$active_session_history.
--------------------------------------------------------------------------------


DEFINE MINUTES = 10

SELECT sample_time, sql_id, session_id, session_serial#, event, wait_class
FROM v$active_session_history
WHERE sample_time > SYSDATE - (&MINUTES/1440)
ORDER BY sample_time DESC
FETCH FIRST 100 ROWS ONLY;
