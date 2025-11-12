--------------------------------------------------------------------------------
-- Script: rebuild_unusable_indexes.sql
-- Descrição: Gera comandos para rebuild de índices UNUSABLE.
--------------------------------------------------------------------------------

SELECT owner, index_name, status
FROM dba_indexes
WHERE status = 'UNUSABLE';

SELECT 'ALTER INDEX '||owner||'.'||index_name||' REBUILD;' AS cmd
FROM dba_indexes WHERE status = 'UNUSABLE';
