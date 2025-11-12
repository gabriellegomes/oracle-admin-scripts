--------------------------------------------------------------------------------
-- Script: tablespace_datafiles_usage.sql
-- Descrição: Mostra uso por datafile, considerando autoextend e tamanho máximo.
--------------------------------------------------------------------------------
COLUMN tablespace_name FORMAT A25
COLUMN file_name FORMAT A55
COLUMN used_mb FORMAT 999,999,999
COLUMN max_mb FORMAT 999,999,999
COLUMN pct_used FORMAT 999.99

SELECT
    df.tablespace_name,
    df.file_name,
    ROUND((df.bytes - fs.bytes_free)/1024/1024,2) AS used_mb,
    ROUND(df.maxbytes/1024/1024,2) AS max_mb,
    ROUND(((df.bytes - fs.bytes_free)/df.maxbytes)*100,2) AS pct_used
FROM
    dba_data_files df
    JOIN (SELECT file_id, SUM(bytes) AS bytes_free
          FROM dba_free_space
          GROUP BY file_id) fs
    ON df.file_id = fs.file_id
ORDER BY
    pct_used DESC;
