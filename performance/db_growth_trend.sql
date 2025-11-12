--------------------------------------------------------------------------------
-- Script: db_growth_trend.sql
-- Descrição: Acompanha tendência de crescimento da base (ex.: por tablespace). Usa views AWR quando disponíveis.
--------------------------------------------------------------------------------

-- Parâmetro de histórico (dias)
DEFINE DAYS_BACK = 30

COLUMN tablespace_name FORMAT A25
COLUMN day FORMAT A12
COLUMN size_mb FORMAT 999,999,999.99

SELECT tablespace_name, TRUNC(begin_time) day, ROUND(SUM(space_used_delta)/1024/1024,2) size_mb
FROM dba_hist_tbspc_space_usage
WHERE begin_time > SYSDATE - &DAYS_BACK
GROUP BY tablespace_name, TRUNC(begin_time)
ORDER BY day, tablespace_name;
