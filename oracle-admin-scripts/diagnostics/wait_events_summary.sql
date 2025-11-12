--------------------------------------------------------------------------------
-- Script: wait_events_summary.sql
-- Descrição: Agrupa eventos de espera por tempo total.
--------------------------------------------------------------------------------

SELECT event, total_waits, time_waited/100 AS time_waited_s
FROM v$system_event
WHERE event NOT LIKE 'SQL*Net message%'
ORDER BY time_waited DESC FETCH FIRST 50 ROWS ONLY;
