--------------------------------------------------------------------------------
-- Script: tablespace_usage.sql
-- Descrição: Exibe uso e percentual livre de tablespaces.
--------------------------------------------------------------------------------

COLUMN tablespace_name FORMAT A25
COLUMN total_mb FORMAT 999,999,999
COLUMN used_mb FORMAT 999,999,999
COLUMN pct_free FORMAT 999.99

SELECT df.tablespace_name,
       ROUND(SUM(df.bytes)/1024/1024) AS total_mb,
       ROUND(SUM(df.bytes)/1024/1024 - SUM(NVL(fs.free_bytes,0))/1024/1024,2) AS used_mb,
       ROUND((1 - (SUM(NVL(fs.free_bytes,0)) / SUM(df.bytes))) * 100, 2) AS pct_used
FROM dba_data_files df
LEFT JOIN (
  SELECT tablespace_name, SUM(bytes) AS free_bytes FROM dba_free_space GROUP BY tablespace_name
) fs ON df.tablespace_name = fs.tablespace_name
GROUP BY df.tablespace_name
ORDER BY pct_used DESC;
