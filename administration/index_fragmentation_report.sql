--------------------------------------------------------------------------------
-- Script: index_fragmentation_report.sql
-- Descrição: Relatório de fragmentação de índices.
--------------------------------------------------------------------------------

COLUMN owner FORMAT A20
COLUMN index_name FORMAT A30

SELECT owner, index_name, blevel, clustering_factor, leaf_blocks, num_rows
FROM dba_indexes i
JOIN (
  SELECT index_name, owner, leaf_blocks FROM dba_ind_statistics
) s ON i.index_name = s.index_name AND i.owner = s.owner
ORDER BY leaf_blocks DESC NULLS LAST FETCH FIRST 50 ROWS ONLY;
