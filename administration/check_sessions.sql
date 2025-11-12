--------------------------------------------------------------------------------
-- Script: check_sessions.sql
-- Descrição: Lista sessões ativas, estado e últimas chamadas.
--------------------------------------------------------------------------------

COLUMN sid FORMAT 9999
COLUMN serial# FORMAT 99999
COLUMN username FORMAT A20
COLUMN program FORMAT A30

SELECT sid, serial#, username, status, osuser, machine, program, event, last_call_et
FROM v$session
WHERE username IS NOT NULL
ORDER BY last_call_et DESC;
