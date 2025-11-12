--------------------------------------------------------------------------------
-- Script: kill_session.sql
-- Descrição: Gera comando ALTER SYSTEM KILL SESSION para SID/SERIAL.
--------------------------------------------------------------------------------

DEFINE SID = 123
DEFINE SERIAL = 45678

SELECT 'ALTER SYSTEM KILL SESSION '''||&SID||','||&SERIAL||''' IMMEDIATE;' AS kill_cmd FROM dual;
