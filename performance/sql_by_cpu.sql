--------------------------------------------------------------------------------
-- Script: sql_by_cpu.sql
-- Descrição: Top SQL por CPU consumido (v$SQL).
--------------------------------------------------------------------------------

-- Top 10 SQL por CPU time
COLUMN sql_id FORMAT A15
COLUMN cpu_time FORMAT 999,999,999

SELECT sql_id, parsing_schema_name, cpu_time/1000000 AS cpu_s, executions, sql_text
FROM v$sql
WHERE executions > 0
ORDER BY cpu_time DESC
FETCH FIRST 10 ROWS ONLY;
