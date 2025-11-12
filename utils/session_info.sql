--------------------------------------------------------------------------------
-- Script: session_info.sql
-- Descrição: Mostra informações da sessão atual.
--------------------------------------------------------------------------------

SELECT sid, serial#, username, osuser, machine, program, terminal
FROM v$session
WHERE audsid = USERENV('SESSIONID');
