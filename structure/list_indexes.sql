--------------------------------------------------------------------------------
-- Script: list_indexes.sql
-- Descrição: Lista índices e colunas associadas.
--------------------------------------------------------------------------------

SELECT owner, index_name, table_owner, table_name, uniqueness
FROM dba_indexes
ORDER BY owner, table_name, index_name;
