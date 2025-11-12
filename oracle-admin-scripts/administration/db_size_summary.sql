--------------------------------------------------------------------------------
-- Script: db_size_summary.sql
-- Descrição: Resumo de tamanho por tablespace e datafile.
--------------------------------------------------------------------------------

COLUMN tablespace_name FORMAT A25
COLUMN file_name FORMAT A40
COLUMN bytes_mb FORMAT 999,999,999

SELECT tablespace_name, file_name, ROUND(bytes/1024/1024,2) AS bytes_mb
FROM dba_data_files
ORDER BY tablespace_name, bytes_mb DESC;
