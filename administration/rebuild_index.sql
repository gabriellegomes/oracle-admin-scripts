--------------------------------------------------------------------------------
-- Script: rebuild_index.sql
-- Descrição: Gera comandos para rebuild de índices por tablespace/schema.
--------------------------------------------------------------------------------

-- Gera statements para rebuild de índices com tamanho acima de N MB
DEFINE MIN_SIZE_MB = 50

SELECT 'ALTER INDEX "'||owner||'"."'||index_name||'" REBUILD; -- size_mb='||ROUND(bytes/1024/1024,2)
FROM (
  SELECT owner, index_name, SUM(bytes) bytes
  FROM dba_segments
  WHERE segment_type = 'INDEX'
  GROUP BY owner, index_name
) WHERE bytes/1024/1024 > &MIN_SIZE_MB;
