--------------------------------------------------------------------------------
-- Script: check_stale_stats.sql
-- Descrição: Identifica objetos com estatísticas antigas ou ausentes.
--------------------------------------------------------------------------------

-- ex.: com estatisticas mais antigas que 30 dias
DEFINE DAYS = 30

COLUMN owner FORMAT A20
COLUMN table_name FORMAT A30
COLUMN last_analyzed FORMAT A20

SELECT owner, table_name, last_analyzed
FROM dba_tables
WHERE owner NOT IN ('SYS','SYSTEM')
  AND (last_analyzed IS NULL OR last_analyzed < SYSDATE - &DAYS)
ORDER BY NVL(last_analyzed, DATE '1900-01-01');
