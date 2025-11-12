--------------------------------------------------------------------------------
-- Script: session_waits.sql
-- Descrição: Detalha eventos de espera por sessão.
--------------------------------------------------------------------------------

SELECT s.sid, s.serial#, s.username, sw.event, sw.wait_time, sw.seconds_in_wait
FROM v$session s JOIN v$session_wait sw ON s.sid = sw.sid
WHERE s.username IS NOT NULL
ORDER BY sw.seconds_in_wait DESC;
