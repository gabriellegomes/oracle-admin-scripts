--------------------------------------------------------------------------------
-- Script: monitor_temp_usage.sql
-- Descrição: Monitora uso da tablespace TEMP.
--------------------------------------------------------------------------------

COLUMN tablespace_name FORMAT A20
COLUMN used_mb FORMAT 9999999
SELECT tablespace_name, ROUND(SUM(bytes_used)/1024/1024,2) used_mb
FROM v$temp_space_header
GROUP BY tablespace_name;
