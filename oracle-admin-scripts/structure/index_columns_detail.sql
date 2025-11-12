--------------------------------------------------------------------------------
-- Script: index_columns_detail.sql
-- Descrição: Mostra colunas de índices e cardinalidade para análise de seletividade.
--------------------------------------------------------------------------------

SELECT i.owner, i.index_name, ic.column_name, ic.column_position
FROM dba_indexes i
JOIN dba_ind_columns ic ON i.index_name = ic.index_name AND i.owner = ic.index_owner
WHERE i.owner NOT IN ('SYS','SYSTEM')
ORDER BY i.owner, i.index_name, ic.column_position;
