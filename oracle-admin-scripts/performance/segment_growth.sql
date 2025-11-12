--------------------------------------------------------------------------------
-- Script: segment_growth.sql
-- Descrição: Mostra crescimento de segmentos por dias (usa AWR HIST views quando disponível).
--------------------------------------------------------------------------------

-- Exemplo simples usando DBA_SEGMENTS para capturar snapshot atual
COLUMN owner FORMAT A20
COLUMN segment_name FORMAT A30
COLUMN bytes_mb FORMAT 999,999,999.99

SELECT owner, segment_name, segment_type, ROUND(bytes/1024/1024,2) AS bytes_mb
FROM dba_segments
WHERE owner NOT IN ('SYS','SYSTEM')
ORDER BY bytes_mb DESC
FETCH FIRST 50 ROWS ONLY;
